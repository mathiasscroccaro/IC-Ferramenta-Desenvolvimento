EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:w_device
LIBS:IC-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L ATMEGA328P-A IC1
U 1 1 58B0E7DC
P 2800 2450
F 0 "IC1" H 2050 3700 50  0000 L BNN
F 1 "ATMEGA328P-A" H 3200 1050 50  0000 L BNN
F 2 "Housings_QFP:TQFP-32_7x7mm_Pitch0.8mm" H 2800 2450 50  0000 C CIN
F 3 "" H 2800 2450 50  0000 C CNN
	1    2800 2450
	1    0    0    -1  
$EndComp
$Comp
L L L1
U 1 1 58B0EB46
P 1500 1650
F 0 "L1" V 1450 1650 50  0000 C CNN
F 1 "10uH" V 1575 1650 50  0000 C CNN
F 2 "Choke_SMD:Choke_SMD_1206_Standard" H 1500 1650 50  0001 C CNN
F 3 "" H 1500 1650 50  0000 C CNN
	1    1500 1650
	-1   0    0    1   
$EndComp
$Comp
L C_Small C4
U 1 1 58B0EE2D
P 1250 2250
F 0 "C4" H 1260 2320 50  0000 L CNN
F 1 "100nF" H 1260 2170 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 1250 2250 50  0001 C CNN
F 3 "" H 1250 2250 50  0000 C CNN
	1    1250 2250
	0    1    1    0   
$EndComp
$Comp
L C_Small C3
U 1 1 58B0EE9A
P 1250 1900
F 0 "C3" H 1260 1970 50  0000 L CNN
F 1 "100nF" H 1260 1820 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 1250 1900 50  0001 C CNN
F 3 "" H 1250 1900 50  0000 C CNN
	1    1250 1900
	0    1    1    0   
$EndComp
$Comp
L Crystal Y1
U 1 1 58B0FB7C
P 4800 2000
F 0 "Y1" H 4800 2150 50  0000 C CNN
F 1 "20MHz" H 4800 1850 50  0000 C CNN
F 2 "Crystals:Crystal_HC18-U_Vertical" H 4800 2000 50  0001 C CNN
F 3 "" H 4800 2000 50  0000 C CNN
	1    4800 2000
	0    1    1    0   
$EndComp
$Comp
L C_Small C5
U 1 1 58B0FCE6
P 5150 1800
F 0 "C5" H 5160 1870 50  0000 L CNN
F 1 "22pF" H 5160 1720 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 5150 1800 50  0001 C CNN
F 3 "" H 5150 1800 50  0000 C CNN
	1    5150 1800
	0    1    1    0   
$EndComp
$Comp
L C_Small C6
U 1 1 58B0FD47
P 5150 2200
F 0 "C6" H 5160 2270 50  0000 L CNN
F 1 "22pF" H 5160 2120 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 5150 2200 50  0001 C CNN
F 3 "" H 5150 2200 50  0000 C CNN
	1    5150 2200
	0    1    1    0   
$EndComp
$Comp
L +5V #PWR01
U 1 1 58B1A45F
P 1500 900
F 0 "#PWR01" H 1500 750 50  0001 C CNN
F 1 "+5V" H 1500 1040 50  0000 C CNN
F 2 "" H 1500 900 50  0000 C CNN
F 3 "" H 1500 900 50  0000 C CNN
	1    1500 900 
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 58B1A83D
P 5400 2750
F 0 "#PWR02" H 5400 2500 50  0001 C CNN
F 1 "GND" H 5400 2600 50  0000 C CNN
F 2 "" H 5400 2750 50  0000 C CNN
F 3 "" H 5400 2750 50  0000 C CNN
	1    5400 2750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 58B1ADE2
P 1000 3800
F 0 "#PWR03" H 1000 3550 50  0001 C CNN
F 1 "GND" H 1000 3650 50  0000 C CNN
F 2 "" H 1000 3800 50  0000 C CNN
F 3 "" H 1000 3800 50  0000 C CNN
	1    1000 3800
	1    0    0    -1  
$EndComp
$Comp
L C_Small C2
U 1 1 58B1B307
P 1250 1450
F 0 "C2" H 1260 1520 50  0000 L CNN
F 1 "100nF" H 1260 1370 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 1250 1450 50  0001 C CNN
F 3 "" H 1250 1450 50  0000 C CNN
	1    1250 1450
	0    1    1    0   
$EndComp
$Comp
L C_Small C1
U 1 1 58B1B34F
P 1250 1150
F 0 "C1" H 1260 1220 50  0000 L CNN
F 1 "100nF" H 1260 1070 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 1250 1150 50  0001 C CNN
F 3 "" H 1250 1150 50  0000 C CNN
	1    1250 1150
	0    1    1    0   
$EndComp
Text GLabel 4050 2950 2    60   Input ~ 0
RX
Text GLabel 4050 3050 2    60   Input ~ 0
TX
$Comp
L +5V #PWR04
U 1 1 58B1E2F0
P 4400 2250
F 0 "#PWR04" H 4400 2100 50  0001 C CNN
F 1 "+5V" H 4400 2390 50  0000 C CNN
F 2 "" H 4400 2250 50  0000 C CNN
F 3 "" H 4400 2250 50  0000 C CNN
	1    4400 2250
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 58B1E34C
P 4400 2450
F 0 "R1" V 4480 2450 50  0000 C CNN
F 1 "60k" V 4400 2450 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 4330 2450 50  0001 C CNN
F 3 "" H 4400 2450 50  0000 C CNN
	1    4400 2450
	1    0    0    -1  
$EndComp
Text GLabel 4500 1650 2    60   Input ~ 0
SPI_CLK
Text GLabel 4500 1450 2    60   Input ~ 0
SPI_MOSI
Text GLabel 4500 1550 2    60   Input ~ 0
SPI_MISO
Text GLabel 4500 1350 2    60   Input ~ 0
SPI_CS
Entry Wire Line
	4050 2200 4150 2300
Entry Wire Line
	4050 2300 4150 2400
Entry Wire Line
	4050 2400 4150 2500
Entry Wire Line
	4050 2500 4150 2600
Entry Wire Line
	4050 2600 4150 2700
Entry Wire Line
	4050 2700 4150 2800
Text Label 3850 2200 0    60   ~ 0
AI0
Text Label 3850 2300 0    60   ~ 0
AI1
Text Label 3850 2400 0    60   ~ 0
AI2
Text Label 3850 2500 0    60   ~ 0
AI3
Text Label 3850 2600 0    60   ~ 0
AI4
Text Label 3850 2700 0    60   ~ 0
AI5
Entry Wire Line
	4050 3150 4150 3250
Entry Wire Line
	4050 3250 4150 3350
Entry Wire Line
	4050 3350 4150 3450
Entry Wire Line
	4050 3450 4150 3550
Entry Wire Line
	4050 3550 4150 3650
Entry Wire Line
	4050 3650 4150 3750
Entry Wire Line
	4000 1450 4100 1350
Entry Wire Line
	4000 1350 4100 1250
Text GLabel 4800 2900 2    60   Input ~ 0
RESET
$Comp
L SW_PUSH SW1
U 1 1 58B1DE05
P 4950 2650
F 0 "SW1" H 4960 2770 50  0000 C CNN
F 1 "Reset" H 4950 2570 50  0000 C CNN
F 2 "Buttons_Switches_SMD:SW_SPST_FSMSM" H 4950 2650 60  0001 C CNN
F 3 "" H 4950 2650 60  0000 C CNN
	1    4950 2650
	1    0    0    -1  
$EndComp
$Comp
L CONN_02X03 P2
U 1 1 58B2F98A
P 8100 3400
F 0 "P2" H 8100 3600 50  0000 C CNN
F 1 "ICSP" H 8100 3200 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x03_Pitch2.54mm" H 8100 2200 50  0001 C CNN
F 3 "" H 8100 2200 50  0000 C CNN
	1    8100 3400
	1    0    0    -1  
$EndComp
Text GLabel 7600 3400 0    60   Input ~ 0
SPI_CLK
Text GLabel 7600 3550 0    60   Input ~ 0
RESET
Text GLabel 8600 3400 2    60   Input ~ 0
SPI_MOSI
Text GLabel 7600 3250 0    60   Input ~ 0
SPI_MISO
$Comp
L +5V #PWR05
U 1 1 58B31AA0
P 8550 3150
F 0 "#PWR05" H 8550 3000 50  0001 C CNN
F 1 "+5V" H 8550 3290 50  0000 C CNN
F 2 "" H 8550 3150 50  0000 C CNN
F 3 "" H 8550 3150 50  0000 C CNN
	1    8550 3150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 58B31ACC
P 8550 3650
F 0 "#PWR06" H 8550 3400 50  0001 C CNN
F 1 "GND" H 8550 3500 50  0000 C CNN
F 2 "" H 8550 3650 50  0000 C CNN
F 3 "" H 8550 3650 50  0000 C CNN
	1    8550 3650
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X08 P4
U 1 1 58B35B29
P 10350 2250
F 0 "P4" H 10350 2700 50  0000 C CNN
F 1 "ANALOG_IN" V 10450 2250 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x08_Pitch2.54mm" H 10350 2250 50  0001 C CNN
F 3 "" H 10350 2250 50  0000 C CNN
	1    10350 2250
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X08 P5
U 1 1 58B37A13
P 10350 3300
F 0 "P5" H 10350 3750 50  0000 C CNN
F 1 "DIGITAL_IO" V 10450 3300 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x08_Pitch2.54mm" H 10350 3300 50  0001 C CNN
F 3 "" H 10350 3300 50  0000 C CNN
	1    10350 3300
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X08 P3
U 1 1 58B37BF8
P 10350 1250
F 0 "P3" H 10350 1700 50  0000 C CNN
F 1 "ANALOG_OUT" V 10450 1250 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x08_Pitch2.54mm" H 10350 1250 50  0001 C CNN
F 3 "" H 10350 1250 50  0000 C CNN
	1    10350 1250
	1    0    0    -1  
$EndComp
$Comp
L R R18
U 1 1 58B38AC5
P 9950 2000
F 0 "R18" V 10030 2000 50  0000 C CNN
F 1 "300" V 9950 2000 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 9880 2000 50  0001 C CNN
F 3 "" H 9950 2000 50  0000 C CNN
	1    9950 2000
	0    1    1    0   
$EndComp
$Comp
L R R7
U 1 1 58B38C40
P 9700 2100
F 0 "R7" V 9780 2100 50  0000 C CNN
F 1 "300" V 9700 2100 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 9630 2100 50  0001 C CNN
F 3 "" H 9700 2100 50  0000 C CNN
	1    9700 2100
	0    1    1    0   
$EndComp
$Comp
L R R19
U 1 1 58B38C83
P 9950 2200
F 0 "R19" V 10030 2200 50  0000 C CNN
F 1 "300" V 9950 2200 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 9880 2200 50  0001 C CNN
F 3 "" H 9950 2200 50  0000 C CNN
	1    9950 2200
	0    1    1    0   
$EndComp
$Comp
L R R8
U 1 1 58B3901F
P 9700 2300
F 0 "R8" V 9780 2300 50  0000 C CNN
F 1 "300" V 9700 2300 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 9630 2300 50  0001 C CNN
F 3 "" H 9700 2300 50  0000 C CNN
	1    9700 2300
	0    1    1    0   
$EndComp
$Comp
L R R20
U 1 1 58B3919C
P 9950 2400
F 0 "R20" V 10030 2400 50  0000 C CNN
F 1 "300" V 9950 2400 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 9880 2400 50  0001 C CNN
F 3 "" H 9950 2400 50  0000 C CNN
	1    9950 2400
	0    1    1    0   
$EndComp
$Comp
L R R9
U 1 1 58B39488
P 9700 2500
F 0 "R9" V 9780 2500 50  0000 C CNN
F 1 "300" V 9700 2500 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 9630 2500 50  0001 C CNN
F 3 "" H 9700 2500 50  0000 C CNN
	1    9700 2500
	0    1    1    0   
$EndComp
$Comp
L R R21
U 1 1 58B394E5
P 9950 2600
F 0 "R21" V 10030 2600 50  0000 C CNN
F 1 "300" V 9950 2600 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 9880 2600 50  0001 C CNN
F 3 "" H 9950 2600 50  0000 C CNN
	1    9950 2600
	0    1    1    0   
$EndComp
$Comp
L R R6
U 1 1 58B39C19
P 9700 1900
F 0 "R6" V 9780 1900 50  0000 C CNN
F 1 "300" V 9700 1900 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 9630 1900 50  0001 C CNN
F 3 "" H 9700 1900 50  0000 C CNN
	1    9700 1900
	0    1    1    0   
$EndComp
Entry Wire Line
	9150 2000 9250 1900
Entry Wire Line
	9150 2100 9250 2000
Entry Wire Line
	9150 2200 9250 2100
Entry Wire Line
	9150 2300 9250 2200
Entry Wire Line
	9150 2400 9250 2300
Entry Wire Line
	9150 2500 9250 2400
Entry Wire Line
	9150 2600 9250 2500
Entry Wire Line
	9150 2700 9250 2600
$Comp
L CONN_01X04 P1
U 1 1 58B470FA
P 6150 3600
F 0 "P1" H 6150 3850 50  0000 C CNN
F 1 "USB_UART" V 6250 3600 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x04_Pitch2.54mm" H 6150 3600 50  0001 C CNN
F 3 "" H 6150 3600 50  0000 C CNN
	1    6150 3600
	1    0    0    -1  
$EndComp
Text Label 3800 3150 0    60   ~ 0
DIO0
Text Label 3800 3250 0    60   ~ 0
DIO1
Text Label 3800 3350 0    60   ~ 0
DIO2
Text Label 3800 3450 0    60   ~ 0
DIO3
Text Label 3800 3550 0    60   ~ 0
DIO4
Text Label 3800 3650 0    60   ~ 0
DIO5
Entry Wire Line
	1600 2800 1700 2700
Entry Wire Line
	1600 2900 1700 2800
Wire Wire Line
	1000 3550 1900 3550
Wire Wire Line
	1000 3650 1900 3650
Wire Wire Line
	1500 900  1500 1500
Connection ~ 1500 1450
Wire Wire Line
	4550 1800 5050 1800
Wire Wire Line
	4800 1800 4800 1850
Wire Wire Line
	4550 2200 5050 2200
Wire Wire Line
	4800 2200 4800 2150
Connection ~ 4800 1800
Connection ~ 4800 2200
Wire Wire Line
	3800 1950 4550 1950
Wire Wire Line
	3800 2050 4550 2050
Wire Wire Line
	5250 1800 5400 1800
Wire Wire Line
	5400 2200 5250 2200
Connection ~ 5400 2200
Wire Wire Line
	1000 1150 1000 3800
Wire Wire Line
	1150 2250 1000 2250
Connection ~ 1000 2250
Wire Wire Line
	1150 1900 1000 1900
Connection ~ 1000 1900
Wire Wire Line
	1500 1800 1500 1900
Connection ~ 1500 1900
Wire Wire Line
	1350 1150 1700 1150
Connection ~ 1500 1150
Wire Wire Line
	1150 1450 1000 1450
Connection ~ 1000 1450
Wire Wire Line
	1150 1150 1000 1150
Wire Wire Line
	1350 2250 1700 2250
Wire Wire Line
	1700 2250 1700 1950
Wire Wire Line
	1700 1950 1900 1950
Wire Wire Line
	1350 1900 1700 1900
Wire Wire Line
	1700 1900 1700 1650
Wire Wire Line
	1700 1650 1900 1650
Wire Wire Line
	1350 1450 1900 1450
Wire Wire Line
	1700 1150 1700 1350
Wire Wire Line
	1700 1350 1900 1350
Connection ~ 1000 3650
Connection ~ 1000 3550
Wire Wire Line
	4050 2950 3800 2950
Wire Wire Line
	4050 3050 3800 3050
Wire Wire Line
	4400 2650 4800 2650
Wire Wire Line
	5400 2650 5100 2650
Wire Wire Line
	5400 1800 5400 2750
Connection ~ 5400 2650
Wire Wire Line
	4550 2050 4550 2200
Wire Wire Line
	4550 1950 4550 1800
Wire Wire Line
	4300 1850 3800 1850
Wire Wire Line
	4300 1650 4300 1850
Wire Wire Line
	4300 1650 4500 1650
Wire Wire Line
	4250 1750 3800 1750
Wire Wire Line
	4250 1550 4250 1750
Wire Wire Line
	4250 1550 4500 1550
Wire Wire Line
	3800 1650 4200 1650
Wire Wire Line
	4200 1650 4200 1450
Wire Wire Line
	4200 1450 4500 1450
Wire Wire Line
	3800 1550 4150 1550
Wire Wire Line
	4150 1550 4150 1350
Wire Wire Line
	4150 1350 4500 1350
Wire Wire Line
	4400 2600 4400 2900
Wire Wire Line
	4400 2900 4800 2900
Wire Wire Line
	4400 2300 4400 2250
Wire Wire Line
	3800 2200 4050 2200
Wire Wire Line
	3800 2300 4050 2300
Wire Wire Line
	3800 2400 4050 2400
Wire Wire Line
	3800 2500 4050 2500
Wire Wire Line
	3800 2600 4050 2600
Wire Wire Line
	3800 2700 4050 2700
Wire Wire Line
	3800 2800 3900 2800
Wire Wire Line
	3900 2800 4400 2900
Wire Bus Line
	4150 2300 4150 2800
Wire Wire Line
	3800 3150 4050 3150
Wire Wire Line
	3800 3250 4050 3250
Wire Wire Line
	3800 3350 4050 3350
Wire Wire Line
	3800 3450 4050 3450
Wire Wire Line
	3800 3550 4050 3550
Wire Wire Line
	3800 3650 4050 3650
Wire Bus Line
	4150 3250 4150 3750
Wire Wire Line
	1900 3450 1000 3450
Connection ~ 1000 3450
Wire Wire Line
	3800 1450 4000 1450
Wire Wire Line
	3800 1350 4000 1350
Wire Bus Line
	4100 1350 4100 1250
Connection ~ 4400 2900
Connection ~ 4400 2650
Wire Wire Line
	8550 3300 8550 3150
Wire Wire Line
	8550 3500 8550 3650
Wire Wire Line
	8350 3300 8550 3300
Wire Wire Line
	8350 3500 8550 3500
Wire Wire Line
	8600 3400 8350 3400
Wire Wire Line
	7850 3400 7600 3400
Wire Wire Line
	7850 3300 7600 3250
Wire Wire Line
	7850 3500 7600 3550
Wire Wire Line
	10100 2400 10150 2400
Wire Wire Line
	9850 2300 10150 2300
Wire Wire Line
	10100 2200 10150 2200
Wire Wire Line
	9850 2100 10150 2100
Wire Wire Line
	10100 2000 10150 2000
Wire Wire Line
	10150 1900 9850 1900
Wire Wire Line
	10100 2600 10150 2600
Wire Wire Line
	10150 2500 9850 2500
Wire Wire Line
	9550 2300 9250 2300
Wire Wire Line
	9800 2400 9250 2400
Wire Wire Line
	9550 2500 9250 2500
Wire Wire Line
	9800 2600 9250 2600
Wire Wire Line
	9800 2200 9250 2200
Wire Wire Line
	9550 2100 9250 2100
Wire Wire Line
	9250 2000 9800 2000
Wire Wire Line
	9550 1900 9250 1900
Wire Bus Line
	9150 2000 9150 2700
Wire Wire Line
	1900 2700 1700 2700
Wire Wire Line
	1900 2800 1700 2800
Wire Bus Line
	1600 2800 1600 2900
Text Label 1700 2700 0    60   ~ 0
AI6
Text Label 1700 2800 0    60   ~ 0
AI7
$Comp
L L L2
U 1 1 58B53221
P 5650 4100
F 0 "L2" V 5600 4100 50  0000 C CNN
F 1 "10uH" V 5725 4100 50  0000 C CNN
F 2 "Choke_SMD:Choke_SMD_1206_Standard" H 5650 4100 50  0001 C CNN
F 3 "" H 5650 4100 50  0000 C CNN
	1    5650 4100
	0    -1   -1   0   
$EndComp
$Comp
L +5V #PWR07
U 1 1 58B536DA
P 5400 4000
F 0 "#PWR07" H 5400 3850 50  0001 C CNN
F 1 "+5V" H 5400 4140 50  0000 C CNN
F 2 "" H 5400 4000 50  0000 C CNN
F 3 "" H 5400 4000 50  0000 C CNN
	1    5400 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 4100 5400 4100
Wire Wire Line
	5400 4100 5400 4000
$Comp
L GND #PWR08
U 1 1 58B54319
P 5400 3350
F 0 "#PWR08" H 5400 3100 50  0001 C CNN
F 1 "GND" H 5400 3200 50  0000 C CNN
F 2 "" H 5400 3350 50  0000 C CNN
F 3 "" H 5400 3350 50  0000 C CNN
	1    5400 3350
	1    0    0    -1  
$EndComp
Text GLabel 5500 3600 0    60   Input ~ 0
RX
Text GLabel 5500 3750 0    60   Input ~ 0
TX
Wire Wire Line
	5500 3600 5700 3600
Wire Wire Line
	5700 3600 5700 3550
Wire Wire Line
	5700 3550 5950 3550
Wire Wire Line
	5500 3750 5700 3750
Wire Wire Line
	5700 3750 5700 3650
Wire Wire Line
	5700 3650 5950 3650
$Comp
L R R25
U 1 1 58B61B18
P 9950 3650
F 0 "R25" V 10030 3650 50  0000 C CNN
F 1 "300" V 9950 3650 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 9880 3650 50  0001 C CNN
F 3 "" H 9950 3650 50  0000 C CNN
	1    9950 3650
	0    1    1    0   
$EndComp
$Comp
L R R13
U 1 1 58B62072
P 9700 3550
F 0 "R13" V 9780 3550 50  0000 C CNN
F 1 "300" V 9700 3550 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 9630 3550 50  0001 C CNN
F 3 "" H 9700 3550 50  0000 C CNN
	1    9700 3550
	0    1    1    0   
$EndComp
$Comp
L R R24
U 1 1 58B620EB
P 9950 3450
F 0 "R24" V 10030 3450 50  0000 C CNN
F 1 "300" V 9950 3450 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 9880 3450 50  0001 C CNN
F 3 "" H 9950 3450 50  0000 C CNN
	1    9950 3450
	0    1    1    0   
$EndComp
$Comp
L R R12
U 1 1 58B6215D
P 9700 3350
F 0 "R12" V 9780 3350 50  0000 C CNN
F 1 "300" V 9700 3350 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 9630 3350 50  0001 C CNN
F 3 "" H 9700 3350 50  0000 C CNN
	1    9700 3350
	0    1    1    0   
$EndComp
$Comp
L R R23
U 1 1 58B62233
P 9950 3250
F 0 "R23" V 10030 3250 50  0000 C CNN
F 1 "300" V 9950 3250 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 9880 3250 50  0001 C CNN
F 3 "" H 9950 3250 50  0000 C CNN
	1    9950 3250
	0    1    1    0   
$EndComp
$Comp
L R R11
U 1 1 58B622A7
P 9700 3150
F 0 "R11" V 9780 3150 50  0000 C CNN
F 1 "300" V 9700 3150 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 9630 3150 50  0001 C CNN
F 3 "" H 9700 3150 50  0000 C CNN
	1    9700 3150
	0    1    1    0   
$EndComp
$Comp
L R R22
U 1 1 58B6232A
P 9950 3050
F 0 "R22" V 10030 3050 50  0000 C CNN
F 1 "300" V 9950 3050 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 9880 3050 50  0001 C CNN
F 3 "" H 9950 3050 50  0000 C CNN
	1    9950 3050
	0    1    1    0   
$EndComp
$Comp
L R R10
U 1 1 58B623A4
P 9700 2950
F 0 "R10" V 9780 2950 50  0000 C CNN
F 1 "300" V 9700 2950 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 9630 2950 50  0001 C CNN
F 3 "" H 9700 2950 50  0000 C CNN
	1    9700 2950
	0    1    1    0   
$EndComp
Wire Wire Line
	9850 2950 10150 2950
Wire Wire Line
	10100 3050 10150 3050
Wire Wire Line
	9850 3150 10150 3150
Wire Wire Line
	10100 3250 10150 3250
Wire Wire Line
	9850 3350 10150 3350
Wire Wire Line
	10100 3450 10150 3450
Wire Wire Line
	9850 3550 10150 3550
Wire Wire Line
	10100 3650 10150 3650
Wire Wire Line
	9550 2950 9250 2950
Wire Wire Line
	9800 3050 9250 3050
Wire Wire Line
	9550 3150 9250 3150
Wire Wire Line
	9800 3250 9250 3250
Wire Wire Line
	9550 3350 9250 3350
Wire Wire Line
	9800 3450 9250 3450
Wire Wire Line
	9550 3550 9250 3550
Wire Wire Line
	9800 3650 9250 3650
Entry Wire Line
	9150 3050 9250 2950
Entry Wire Line
	9150 3150 9250 3050
Entry Wire Line
	9150 3250 9250 3150
Entry Wire Line
	9150 3350 9250 3250
Entry Wire Line
	9150 3450 9250 3350
Entry Wire Line
	9150 3550 9250 3450
Entry Wire Line
	9150 3650 9250 3550
Entry Wire Line
	9150 3750 9250 3650
Wire Bus Line
	9150 3050 9150 3750
Text Label 9300 2950 0    60   ~ 0
DIO0
Text Label 9300 3050 0    60   ~ 0
DIO1
Text Label 9300 3150 0    60   ~ 0
DIO2
Text Label 9300 3250 0    60   ~ 0
DIO3
Text Label 9300 3350 0    60   ~ 0
DIO4
Text Label 9300 3450 0    60   ~ 0
DIO5
Text Label 9300 3550 0    60   ~ 0
DIO6
Text Label 9300 3650 0    60   ~ 0
DIO7
Text Label 3800 1350 0    60   ~ 0
DIO6
Text Label 3800 1450 0    60   ~ 0
DIO7
$Comp
L DAC8568 U1
U 1 1 58B730CC
P 7300 1850
F 0 "U1" H 7300 2250 60  0000 C CNN
F 1 "DAC8568" H 7300 1150 60  0000 C CNN
F 2 "Housings_SSOP:SSOP-16_5.3x6.2mm_Pitch0.65mm" H 7300 1850 60  0001 C CNN
F 3 "" H 7300 1850 60  0001 C CNN
	1    7300 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 2250 6250 2250
Wire Wire Line
	6550 2150 6250 2150
Wire Wire Line
	6550 2050 6250 2050
Wire Wire Line
	6550 1950 6250 1950
Wire Wire Line
	8100 1950 8400 1950
Wire Wire Line
	8100 2050 8400 2050
Wire Wire Line
	8100 2150 8400 2150
Wire Wire Line
	8100 2250 8400 2250
Entry Wire Line
	6150 2350 6250 2250
Entry Wire Line
	6150 2250 6250 2150
Entry Wire Line
	6150 2150 6250 2050
Entry Wire Line
	6150 2050 6250 1950
Entry Wire Line
	8400 1950 8500 2050
Entry Wire Line
	8400 2050 8500 2150
Entry Wire Line
	8400 2150 8500 2250
Entry Wire Line
	8400 2250 8500 2350
Wire Bus Line
	6150 2050 6150 2350
Wire Bus Line
	8500 2050 8500 2350
$Comp
L GND #PWR09
U 1 1 58B7F6D5
P 8700 1900
F 0 "#PWR09" H 8700 1650 50  0001 C CNN
F 1 "GND" H 8700 1750 50  0000 C CNN
F 2 "" H 8700 1900 50  0000 C CNN
F 3 "" H 8700 1900 50  0000 C CNN
	1    8700 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 1850 8700 1850
Wire Wire Line
	8700 1850 8700 1900
Text GLabel 8400 1650 2    60   Input ~ 0
SPI_CLK
Wire Wire Line
	8400 1650 8100 1650
Text Label 6300 1950 0    60   ~ 0
AO0
Text Label 8150 1950 0    60   ~ 0
AO1
Text Label 6300 2050 0    60   ~ 0
AO2
Text Label 8150 2050 0    60   ~ 0
AO3
Text Label 6300 2150 0    60   ~ 0
AO4
Text Label 8150 2150 0    60   ~ 0
AO5
Text Label 6300 2250 0    60   ~ 0
AO6
Text Label 8150 2250 0    60   ~ 0
AO7
$Comp
L +5V #PWR010
U 1 1 58B86E04
P 5800 1650
F 0 "#PWR010" H 5800 1500 50  0001 C CNN
F 1 "+5V" H 5800 1790 50  0000 C CNN
F 2 "" H 5800 1650 50  0000 C CNN
F 3 "" H 5800 1650 50  0000 C CNN
	1    5800 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 1850 5800 1850
Wire Wire Line
	5800 1650 5800 2050
$Comp
L GND #PWR011
U 1 1 58B8BB52
P 5800 2700
F 0 "#PWR011" H 5800 2450 50  0001 C CNN
F 1 "GND" H 5800 2550 50  0000 C CNN
F 2 "" H 5800 2700 50  0000 C CNN
F 3 "" H 5800 2700 50  0000 C CNN
	1    5800 2700
	1    0    0    -1  
$EndComp
$Comp
L C_Small C8
U 1 1 58B8E24C
P 6150 2500
F 0 "C8" H 6160 2570 50  0000 L CNN
F 1 "150nF" H 6160 2420 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 6150 2500 50  0001 C CNN
F 3 "" H 6150 2500 50  0000 C CNN
	1    6150 2500
	0    1    1    0   
$EndComp
$Comp
L C_Small C7
U 1 1 58B8E69E
P 5800 2150
F 0 "C7" H 5810 2220 50  0000 L CNN
F 1 "1uF" H 5810 2070 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 5800 2150 50  0001 C CNN
F 3 "" H 5800 2150 50  0000 C CNN
	1    5800 2150
	-1   0    0    1   
$EndComp
Wire Wire Line
	6250 2500 6400 2500
Wire Wire Line
	6400 2500 6400 2350
Wire Wire Line
	6400 2350 6550 2350
Wire Wire Line
	6050 2500 5800 2500
Wire Wire Line
	5800 2250 5800 2700
Connection ~ 5800 2500
Connection ~ 5800 1850
$Comp
L GND #PWR012
U 1 1 58B9789E
P 6300 1450
F 0 "#PWR012" H 6300 1200 50  0001 C CNN
F 1 "GND" H 6300 1300 50  0000 C CNN
F 2 "" H 6300 1450 50  0000 C CNN
F 3 "" H 6300 1450 50  0000 C CNN
	1    6300 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 1650 6450 1650
Wire Wire Line
	6450 1650 6450 1350
Wire Wire Line
	6450 1350 6300 1350
Wire Wire Line
	6300 1350 6300 1450
Text GLabel 6300 1750 0    60   Input ~ 0
SPI_CS
Wire Wire Line
	6300 1750 6550 1750
$Comp
L +5V #PWR013
U 1 1 58BA6BAB
P 8300 2500
F 0 "#PWR013" H 8300 2350 50  0001 C CNN
F 1 "+5V" H 8300 2640 50  0000 C CNN
F 2 "" H 8300 2500 50  0000 C CNN
F 3 "" H 8300 2500 50  0000 C CNN
	1    8300 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 2500 8300 2550
Wire Wire Line
	8300 2550 8200 2550
Wire Wire Line
	8200 2550 8200 2350
Wire Wire Line
	8200 2350 8100 2350
$Comp
L R R17
U 1 1 58BAD099
P 9950 1600
F 0 "R17" V 10030 1600 50  0000 C CNN
F 1 "300" V 9950 1600 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 9880 1600 50  0001 C CNN
F 3 "" H 9950 1600 50  0000 C CNN
	1    9950 1600
	0    1    1    0   
$EndComp
$Comp
L R R5
U 1 1 58BAD79F
P 9700 1500
F 0 "R5" V 9780 1500 50  0000 C CNN
F 1 "300" V 9700 1500 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 9630 1500 50  0001 C CNN
F 3 "" H 9700 1500 50  0000 C CNN
	1    9700 1500
	0    1    1    0   
$EndComp
$Comp
L R R16
U 1 1 58BAD87B
P 9950 1400
F 0 "R16" V 10030 1400 50  0000 C CNN
F 1 "300" V 9950 1400 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 9880 1400 50  0001 C CNN
F 3 "" H 9950 1400 50  0000 C CNN
	1    9950 1400
	0    1    1    0   
$EndComp
$Comp
L R R4
U 1 1 58BAD90C
P 9700 1300
F 0 "R4" V 9780 1300 50  0000 C CNN
F 1 "300" V 9700 1300 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 9630 1300 50  0001 C CNN
F 3 "" H 9700 1300 50  0000 C CNN
	1    9700 1300
	0    1    1    0   
$EndComp
$Comp
L R R15
U 1 1 58BAD9A2
P 9950 1200
F 0 "R15" V 10030 1200 50  0000 C CNN
F 1 "300" V 9950 1200 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 9880 1200 50  0001 C CNN
F 3 "" H 9950 1200 50  0000 C CNN
	1    9950 1200
	0    1    1    0   
$EndComp
$Comp
L R R3
U 1 1 58BADA35
P 9700 1100
F 0 "R3" V 9780 1100 50  0000 C CNN
F 1 "300" V 9700 1100 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 9630 1100 50  0001 C CNN
F 3 "" H 9700 1100 50  0000 C CNN
	1    9700 1100
	0    1    1    0   
$EndComp
$Comp
L R R14
U 1 1 58BADACD
P 9950 1000
F 0 "R14" V 10030 1000 50  0000 C CNN
F 1 "300" V 9950 1000 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 9880 1000 50  0001 C CNN
F 3 "" H 9950 1000 50  0000 C CNN
	1    9950 1000
	0    1    1    0   
$EndComp
$Comp
L R R2
U 1 1 58BADB66
P 9700 900
F 0 "R2" V 9780 900 50  0000 C CNN
F 1 "300" V 9700 900 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 9630 900 50  0001 C CNN
F 3 "" H 9700 900 50  0000 C CNN
	1    9700 900 
	0    1    1    0   
$EndComp
Wire Wire Line
	9850 1100 10150 1100
Wire Wire Line
	10100 1000 10150 1000
Wire Wire Line
	9850 900  10150 900 
Wire Wire Line
	10100 1200 10150 1200
Wire Wire Line
	9850 1300 10150 1300
Wire Wire Line
	10100 1400 10150 1400
Wire Wire Line
	9850 1500 10150 1500
Wire Wire Line
	10100 1600 10150 1600
Wire Wire Line
	9550 900  9250 900 
Wire Wire Line
	9800 1000 9250 1000
Entry Wire Line
	9150 1000 9250 900 
Entry Wire Line
	9150 1100 9250 1000
Entry Wire Line
	9150 1200 9250 1100
Entry Wire Line
	9150 1300 9250 1200
Entry Wire Line
	9150 1400 9250 1300
Entry Wire Line
	9150 1500 9250 1400
Entry Wire Line
	9150 1600 9250 1500
Entry Wire Line
	9150 1700 9250 1600
Wire Wire Line
	9250 1100 9550 1100
Wire Wire Line
	9250 1200 9800 1200
Wire Wire Line
	9550 1300 9250 1300
Wire Wire Line
	9250 1400 9800 1400
Wire Wire Line
	9250 1500 9550 1500
Wire Wire Line
	9250 1600 9800 1600
Wire Bus Line
	9150 1000 9150 1700
Text Label 9350 900  0    60   ~ 0
AO0
Text Label 9350 1000 0    60   ~ 0
AO1
Text Label 9350 1100 0    60   ~ 0
AO2
Text Label 9350 1200 0    60   ~ 0
AO3
Text Label 9350 1300 0    60   ~ 0
AO4
Text Label 9350 1400 0    60   ~ 0
AO5
Text Label 9350 1500 0    60   ~ 0
AO6
Text Label 9350 1600 0    60   ~ 0
AO7
Text Label 9350 2600 0    60   ~ 0
AI0
Text Label 9350 2500 0    60   ~ 0
AI1
Text Label 9350 2400 0    60   ~ 0
AI2
Text Label 9350 2300 0    60   ~ 0
AI3
Text Label 9350 2200 0    60   ~ 0
AI4
Text Label 9350 2100 0    60   ~ 0
AI5
Text Label 9350 2000 0    60   ~ 0
AI6
Text Label 9350 1900 0    60   ~ 0
AI7
Wire Wire Line
	5800 4100 5850 4100
Wire Wire Line
	5850 4100 5850 3750
Wire Wire Line
	5850 3750 5950 3750
Wire Wire Line
	5950 3450 5700 3450
Wire Wire Line
	5700 3450 5700 3250
Wire Wire Line
	5700 3250 5400 3250
Wire Wire Line
	5400 3250 5400 3350
Text GLabel 8400 1750 2    60   Input ~ 0
SPI_MOSI
Wire Wire Line
	8400 1750 8100 1750
$EndSCHEMATC
