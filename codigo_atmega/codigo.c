/*
 * main.c
 *
 * Created: 11/02/2017 18:08:10
 * Author : User
 */ 

#include <avr/io.h>
#include <avr/interrupt.h>

#define _FULL_ 1
#define _BUSY_ 0

/* 

Configurações iniciais dos fuses:

- Retirar o fuse que divide o clock por 8
- Considera-se um cristal de 20Mhz

*/

#define tam_buffer_spi 10
#define tam_buffer_uart 30
#define TIME_OUT 10

void configura_portas(void);
void configura_uart(void);
void configura_spi(void);
void configura_timer(void);
void configura_adc(void);

void push_spi_buffer(void);
void pull_spi_buffer(unsigned long);
void push_uart_tx_buffer(void);
void adc_read(void);
void pull_uart_tx_buffer(unsigned short);
void push_uart_tx_buffer(void);
void set_io(unsigned char);
void set_io_direction(unsigned char);
void clean_uart_rx_buffer(unsigned char);
void set_channel(unsigned char);
void push_uart_rx_buffer(void);
void set_sampling_escaler(unsigned char);

struct _uart_buffer_rx
{
	unsigned char data[tam_buffer_uart];
	signed char position;
};

struct _spi_buffer
{
	unsigned long data[tam_buffer_spi];
	signed char position; // IF (-1) THEN no data.
};

struct _uart_buffer_tx
{
	unsigned short data[tam_buffer_uart];
	signed char position;
	unsigned char statusBuffer;
};

struct _spi_register
{
	unsigned long data[10];	
};

struct _spi_register spi_register;
struct _spi_buffer spi_buffer;
struct _uart_buffer_tx uart_tx_buffer[2];
struct _uart_buffer_rx uart_rx_buffer;

unsigned short temporizador[2];

/************************************************************************/
/* @resumo: Interrupção executada com a comparação do timer0            */
/************************************************************************/
ISR(TIMER0_COMPA_vect)
{
	char i;
	TIFR0=(1<<OCF0A);
	for (i=0;i<2;i++)
		if (temporizador[i] > 0)
			temporizador[i]--;
}

/************************************************************************/
/* @resumo: Interrupção executada com a recepção de dados via uart      */
/************************************************************************/
ISR(USART_RX_vect)
{
	/* Lê dado recebido via uart */
	unsigned char data = UDR0;
	
	/* Se o buffer de recepção uart está cheio, sai da função */
	if (uart_rx_buffer.position == tam_buffer_uart) 
		return;
		
	/* Acrescenta dado recebido via uart na pilha */
	uart_rx_buffer.data[++uart_rx_buffer.position] = data;
	
	/* Seta temporizador de timeout */
	temporizador[1] = TIME_OUT;
}

/************************************************************************/
/* @resumo: Função de configuração das portas: entrada ou saída         */
/************************************************************************/
void configura_portas()
{
	set_io_direction(0xff);	
}

/************************************************************************/
/* @resumo: Função de configuração da uart: velocidade, bits, interupção*/
/************************************************************************/
void configura_uart()
{
	// Setando o baud rate para clock externo de 20MH
	UBRR0H = 0;
	UBRR0L = 0;	
	UBRR0L = 4;		// Baud Rate = 250 kbits/s;
	
	// Habilitando Tx, Rx uart e interrupção Rx
	UCSR0B = (1<<RXEN0) | (1<<TXEN0) | (1<<RXCIE0);
	
	// 8bits
	UCSR0C = (1<<UCSZ00) | (1<<UCSZ01);
}

/************************************************************************/
/* @resumo: Função de configuração spi: velocidade, clock, modo         */
/************************************************************************/
void configura_spi()
{
	PRR |= (0<<PRSPI);
	
	/* Configura o pino do portb como saida para Slave Select (SS) */
	DDRB |= (1<<DDB5) | (1<<DDB3) | (1<<DDB2) | (1<<DDB0);
	
	/* Configura SPI: habilita spi; modo mestre; clock on rise; freq = fosc/64 */
	SPCR |= (1<<SPE) | (1<<MSTR) | (1<<CPOL) | (1<<SPR1);
}

/************************************************************************/
/* @resumo: Função de configuração do timer0: prescaler,comparador...   */
/************************************************************************/
void configura_timer()
{
	TIMSK0	= (1<<OCIE0A);				// Habilita interrupção de comparação do Timer0
	TCCR0A	= (1<<WGM01);				// Modo comparação e clean
	TCCR0B	|= (1<<CS02) | (1<<CS00);	// f_prescaler = 20M/1024 = 78,125 kHz
	OCR0A = 39;							// 1028 hz -> utilizado como trigger para conversão ADC	
}

/************************************************************************/
/* @resumo: Função de configuração do ADC: referência, trigger, velocidade
/************************************************************************/
void configura_adc()
{
	/* Seleciona Vref ligado ao capacitor e indutor; Resultado da conversão justificado à esquerda */
	ADMUX	= (1<<REFS0) | (1<<ADLAR);
	
	/* Habilita ADC; Seleciona modo auto trigger; Divisão do system clock em 64 para o ADC. */
	ADCSRA	= (1<<ADEN) | (1<<ADATE)  | (1<<ADPS2) | (1<<ADPS1);
	
	/* Configura o Trigger do ADC para ser acionado ao atingir comparação A do Timer0 */
	ADCSRB	|= (1<<ADTS1) | (1<<ADTS0);
	
	/* Desabilita input digital */
	DIDR0	|= 0x3f; 
	
	/* Inicializa o adc com gatilho para o comparador do Timer0 */
	ADCSRA |= (1<<ADSC);
	
	/* Inicializa lendo o canal 8 */
	ADMUX = (ADMUX&0xf0) | (8);
}

/************************************************************************/
/* @resumo: Função de configuração do DAC                               */
/************************************************************************/
void configura_dac()
{
	pull_spi_buffer((unsigned long)0x07000000);		// Reseta DAC
	pull_spi_buffer((unsigned long)0x040000ff);		// Power On todos os canais
	pull_spi_buffer((unsigned long)0x090a0000);		// Referência On
}

/************************************************************************/
/* @resumo: Esta função envia os 2 bytes via SPI ao DAC. Nesta função   */
/* os dados contidos na pilha SPI são enviados por meio de uma máquina  */
/* de estados. Esta função deve ser chamada continuamente				*/
/************************************************************************/
void push_spi_buffer()
{
	static unsigned char state = 0;
	static unsigned long data = 0;
	
	unsigned char temp;
	
	
	switch(state)
	{
		case 0:
			if (spi_buffer.position == -1)
				break;
			else
			{
				PORTB &= ~(1<<PORTB2);						// Abaixa CS
				data = spi_buffer.data[0];					// Copia dado a ser enviado
				
				for (temp=0;temp<tam_buffer_spi-1;temp++)
					spi_buffer.data[temp] = spi_buffer.data[temp+1];
					
				spi_buffer.position--;						// Reorganiza fila de envio spi
				state++;									// Aumenta estado da máquina de envio spi
				temp = (unsigned char)(data>>24)&(0xff);
				SPDR = temp;								// Envia o primeiro byte via spi
			}
			break;
			
		case 1:
			if (!(SPSR & (1<<SPIF)))						// Não terminou envio do byte?
				break;
			else
			{
				temp = (unsigned char)(data>>16)&(0xff);
				SPDR = temp;								// Envia o segundo byte via spi
				state++;
			}
			break;
			
		case 2:
			if (!(SPSR & (1<<SPIF)))						// Não terminou envio do byte?
				break;
			else
			{
				temp = (unsigned char)(data>>8)&(0xff);
				SPDR = temp;								// Envia o terceiro byte via spi
				state++;
			}
			break;
			
		case 3:
			if (!(SPSR & (1<<SPIF)))						// Não terminou envio do byte?
				break;
			else
			{
				temp = (unsigned char)(data)&(0xff);
				SPDR = temp;								// Envia o quarto byte via spi
				state++;
			}
			break;
		case 4:
			if (!(SPSR & (1<<SPIF)))						// Não terminou envio do byte?
				break;
			else
			{
				state = 0;									// Rezeta máquina de envio spi
				PORTB |= (1<<PORTB2);						// Levanta pino CS
			}
			break;
	}
}

/************************************************************************/
/* @resumo: Esta função aloca os dados contidos em "data" no buffer SPI */
/* @data: Dado a ser armazenado no buffer SPI                           */
/************************************************************************/
void pull_spi_buffer(unsigned long data)
{
	/* Se o buffer está cheio, descarta o requerimento de empilhamento no buffer spi */
	if (spi_buffer.position == tam_buffer_spi-1)	
		return;
	
	spi_buffer.position++;
	spi_buffer.data[spi_buffer.position] = data;
}

/************************************************************************/
/* @resumo: Esta função coleta os dados amostrados e os aloca na pilha  */
/* uart para envio à interface.											*/
/************************************************************************/
void adc_read()
{
	static unsigned char state = 0;
	unsigned char temp,temp2;
	
	switch (state)
	{
		case 0:		
			if (!(ADCSRA & (1<<ADSC)))	// Terminou a conversão?
			{
				temp = ADCL;			// Realiza a leitura dos bits menos significativos
				temp2 = ADCH;			// Realiza a leitura dos bits mais significativos
				pull_uart_tx_buffer((unsigned short)(temp2<<2) | (temp>>6));	// Aloca o valor amostrado no buffer uart
				state++;
			}
		break;
		
		case 1:
			if ((ADCSRA & (1<<ADSC)))	// Começou uma nova conversão?
			{
				state = 0;
			}
		break;
	}
}

/************************************************************************/
/* @resumo: Esta função adiciona o valor de "data" ao buffer de envio   */
/* uart.																*/
/* @data: valor a ser adicionado no buffer								*/
/************************************************************************/
void pull_uart_tx_buffer(unsigned short data)
{		
	static unsigned char writingAtBuffer = 0;
	
	/* Adiciona valor de "data" ao buffer de envio uart */
	uart_tx_buffer[writingAtBuffer].data[uart_tx_buffer[writingAtBuffer].position++] = data;
	
	if (uart_tx_buffer[writingAtBuffer].position == tam_buffer_uart) // Buffer está cheio?
	{
		/* Buffer atual está cheio, pronto para ser enviado */
		uart_tx_buffer[writingAtBuffer].statusBuffer = _FULL_;
		uart_tx_buffer[writingAtBuffer].position = 0;
		
		/* Muda o buffer de escrita */
		writingAtBuffer ^= 0x01;
		
		/* Buffer atual está ocupado */
		uart_tx_buffer[writingAtBuffer].statusBuffer = _BUSY_;
		uart_tx_buffer[writingAtBuffer].position = 0;
	}
}

/************************************************************************/
/* @resumo: Esta função retira valores do buffer uart e os envia ao     */
/* via uart à interface													*/
/************************************************************************/
void push_uart_tx_buffer()
{
	static unsigned char state = 0;
	static unsigned char position = 0;
	static unsigned char readingAtBuffer = 0;
	
	static unsigned char contador =0;
	
	unsigned short temp=0;
	unsigned short maxValue=0;
	static unsigned char countInteger=0;
	static unsigned char countFrational=0;
	static unsigned char countFrational2=0;

	if ((ADMUX & 0x0f) == 8)
	return;
	
	switch(state)
	{
		case 0:		/* Se o buffer está cheio, ~_BUSY_, vai o próximo estado */
		if (uart_tx_buffer[readingAtBuffer].statusBuffer == _BUSY_)
			break;
		else
		{
			state++;
		}
		break;
		
		case 1:		/* Inicia o envio de um dado */
		if (!(UCSR0A & (1<<UDRE0)))	// Está enviando algo?
			break;
		else
		{
			UDR0 = ';';
			state++;
		}
		break;
		
		case 2:		/* Envia o valor inteiro do dado (;X,00) */
		if (!(UCSR0A & (1<<UDRE0)))	// Está enviando algo?
			break;
		else
		{
			/* Zera os valores a serem enviados */
			countInteger=0;
			countFrational=0;
			
			/* Copia o valor do buffer para uma variável interna */
			maxValue = uart_tx_buffer[readingAtBuffer].data[position++];
			
			/* Calcula o valor inteiro e decimal a ser enviado via uart */
			/* 204 = 1V em 10bits de resolução */
			/* 20 = 0.1V em 10bits de resolução */
			/* 2 = 0.01V em 10bits de resolução */
			while(maxValue >= 204 && temp <= maxValue)
			{
				if (temp==204)
				{
					temp=0;
					countInteger++;
					maxValue=maxValue-204;
				}
				temp++;
			}
			
			temp = 0;
			
			while(maxValue >= 20 && temp <= maxValue)
			{
				if (temp==20)
				{
					temp=0;
					countFrational++;
					maxValue=maxValue-20;
				}
				temp++;
			}
			
			temp = 0;
			
			while(maxValue >= 2 && temp <= maxValue)
			{
				if (temp==2)
				{
					temp=0;
					countFrational2++;
					maxValue=maxValue-2;
				}
				temp++;
			}
			
			if (countFrational2 == 10)
			{
				countFrational++;
				countFrational2=0;
			}
			
			if (countFrational == 10)
			{
				countInteger++;
				countFrational = 0;
			}

			/* Envia o valor inteiro do dado */
			temp = countInteger+'0';
			UDR0 = temp;
			state++;
		}
		
		break;
		
		case 3: /* Envia o caracter ',' (;0,00) */
		if (!(UCSR0A & (1<<UDRE0))) // Está enviando algo?
			break;
		else
		{
			UDR0 = ',';
			state++;
		}
		break;
		
		case 4: /* Envia a parcela decimal do dado (;0,X0) */
		if (!(UCSR0A & (1<<UDRE0))) // Está enviando algo?
			break;
		else
		{
			UDR0 = countFrational+'0';
			state++;
		}
		
		case 5: /* Envia  a parcela decimal do dado (;0,0X)*/
		if (!(UCSR0A & (1<<UDRE0))) // Está enviando algo?
			break;
		else
		{
			temp = countFrational2+'0';
			UDR0 = temp;
			
			countFrational = 0;
			countFrational2 = 0;
			countInteger = 0;
			
			/* Se a posição do buffer de envio for a última */
			if (position >= tam_buffer_uart)
			{
				/* Comuta o buffer de leitura */
				uart_tx_buffer[readingAtBuffer].statusBuffer = _BUSY_;
				readingAtBuffer ^= 0x01;
				state = 0;
				position=0;
			}
			/* Se não, volta para o estado 1 para enviar o próximo dado do buffer */
			else
			{
				state=1;
			}
		}
		break;
	}
} 

/************************************************************************/
/* @resumo: Esta função altera a direção dos pinos digitais				*/
/* @direction: Byte que configura entrada ou saída dos pinos. Se 0,		*/
/* entrada. Se 1, saída.												 */
/************************************************************************/
void set_io_direction(unsigned char direction)
{
	unsigned char i;
	
	for (i=0;i<8;i++) // Varre todos os 8 bits das portas digitais
	{
		if (i<6)	// Para os 6 primeiros bits
		{
			if(direction&(1<<i))
				DDRD |= ((direction&(1<<i))<<2);
			else
				DDRD &= ~(1<<(i+2));
		}
		else		// Para os 2 últimos bits
		{
			if (direction&(1<<i))
				DDRB |= ((direction>>6)&(1<<(i-6)));
			else
				DDRB &= ~(1<<(i-6));
		}
	}
}

/************************************************************************/
/* @resumo: Esta função configura o valor das portas digitai            */
/* @value: Byte a ser colocado nas portas digitais                      */
/************************************************************************/
void set_io(unsigned char value)
{
	unsigned char i;
	
	for (i=0;i<8;i++)
	{
		if (i<6)
		{
			if(value&(1<<i))
				PORTD |= ((value&(1<<i))<<2);
			else
				PORTD &= ~(1<<(i+2));
		}
		else
		{
			if (value&(1<<i))
				PORTB |= ((value>>6)&(1<<(i-6)));
			else
				PORTB &= ~(1<<(i-6));
		}
	}
}

/************************************************************************/
/* @resumo: Esta função limpa 'n' valores do buffer de recepção uart.   */
/* o restante dos valores é realocado automaticamente pela função		*/
/* @n: número de bytes a ser excluído do buffer uart                    */
/************************************************************************/
void clean_uart_rx_buffer(unsigned char n)
{
	unsigned char j,i;
	
	for (i=0;i<n;i++)
		for(j=0;j<tam_buffer_uart;j++) 
			if (j == tam_buffer_uart-1)
				uart_rx_buffer.data[j] = 0;
			else
				uart_rx_buffer.data[j] = uart_rx_buffer.data[j+1];
	
	for (i=0;i<tam_buffer_uart && uart_rx_buffer.data[i]== 0;i++) {}
	
	if (i == tam_buffer_uart)
		uart_rx_buffer.position = -1;
}

/************************************************************************/
/* @resumo: Esta função seleciona o canal a ser amostrado pelo ADC      */
/* @data: canal a ser amostrado                                         */
/************************************************************************/
void set_channel(unsigned char data)
{
	if (data != 0xff)
		ADMUX = (ADMUX&0xf0) | (data&0x0f);
	else
		ADMUX = (ADMUX&0xf0) | (8);
}

/************************************************************************/
/* @resumo: Esta função retira valores do buffer de recepção e trata    */
/* os valores recebidos													*/
/************************************************************************/
void push_uart_rx_buffer()
{
	static unsigned char state = 0; 
	unsigned long valor = 0;
	
	unsigned char i,j;
	
	unsigned long _channel = 0;

	/* Se timeout e buffer de recepção não é nulo, entra no if */
	if (temporizador[1] == 0 && uart_rx_buffer.position != -1)
	{
		/* Não recebeu o caracter que inicializa comunicação? */	
		if (uart_rx_buffer.data[0] != '&')
		{
			/* Limpa buffer de recepção e sai da função */
			clean_uart_rx_buffer(tam_buffer_uart);
			return;
		}
		/* Caso contrário, retira do buffer o caracter de recepção e trata o restante do buffer */
		else
		{
			clean_uart_rx_buffer(1);
		}
		
		/* Seta a direção o valor das portas digitais e exclui um byte */
		set_io(uart_rx_buffer.data[0]);
		clean_uart_rx_buffer(1);
		
		/* Seleciona o canal de amostragem e exclui um byte */
		set_channel(uart_rx_buffer.data[0]);
		clean_uart_rx_buffer(1);		
		
		/* Seta todos os valores analógicos dos canais do DAC */
		for (_channel=0;_channel<8;_channel++)
		{
			/* Ajusta o valor de 16bits para ser envia via SPI*/
			valor = (unsigned long) uart_rx_buffer.data[1] |  ((unsigned long) uart_rx_buffer.data[0]<<8);
			valor = valor<<4;
			valor |= 0x03000000;
			valor |= (_channel<<20);
			
			//spi_register.data[_channel] = valor;
			
			/* Aloca o valor a ser enviado via protocolo SPI ao DAC */
			pull_spi_buffer(valor);
			
			/* Limpa dois bytes do buffer de recepção uart */
			clean_uart_rx_buffer(2);
		}
		
		/* Limpa todo o buffer de recepção uart */
		clean_uart_rx_buffer(tam_buffer_uart);
	}	
}

int main(void)
{
	
	spi_buffer.position = -1;
	

	/* Configura todos os parâmetros */
	configura_portas();
	configura_spi();
	configura_timer();
	configura_uart();
	configura_adc();
	configura_dac();
	
	/* Habilita interrupções */
	sei();
	
    while (1) 
    {	
		/* Máquina que envia valores à interface*/
		push_uart_tx_buffer();			
		/* Máquina que envia valores ao DAC */
		push_spi_buffer();
		/* Máquina que recepciona os valores via uart */
		push_uart_rx_buffer();
		/* Máquina que realiza a leitura dos valores do ADC */
		adc_read();		
	}
		
}

