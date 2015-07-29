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
LIBS:custom
LIBS:chiindii-cache
EELAYER 25 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 1
Title "Chiindii"
Date ""
Rev "2.0"
Comp "Digital Cave"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L NCP1400A VR1
U 1 1 55B6E76A
P 2600 1800
F 0 "VR1" H 2600 1650 60  0000 C CNN
F 1 "NCP1400A" H 2600 1550 60  0000 C CNN
F 2 "Housings_SOT-23_SOT-143_TSOT-6:SOT-23-5" H 2600 1800 60  0001 C CNN
F 3 "" H 2600 1800 60  0000 C CNN
	1    2600 1800
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR01
U 1 1 55B6E89B
P 1700 1200
F 0 "#PWR01" H 1700 1050 50  0001 C CNN
F 1 "+BATT" H 1700 1340 50  0000 C CNN
F 2 "" H 1700 1200 60  0000 C CNN
F 3 "" H 1700 1200 60  0000 C CNN
	1    1700 1200
	1    0    0    -1  
$EndComp
$Comp
L LSMALL L1
U 1 1 55B6E8DA
P 1900 1600
F 0 "L1" H 1900 1550 40  0000 C CNN
F 1 "22uH" H 1900 1650 40  0000 C CNN
F 2 "DigitalCave:SM0603_VALUE" H 1900 1600 60  0001 C CNN
F 3 "" H 1900 1600 60  0000 C CNN
	1    1900 1600
	1    0    0    -1  
$EndComp
$Comp
L DSCHSMALL D3
U 1 1 55B6E95B
P 2550 1350
F 0 "D3" V 2640 1345 40  0000 C CNN
F 1 "DSCHSMALL" V 2465 1350 40  0000 C CNN
F 2 "DigitalCave:SOD-323_DIODE" V 2480 1350 30  0001 C CNN
F 3 "" H 2550 1400 30  0000 C CNN
	1    2550 1350
	0    1    1    0   
$EndComp
$Comp
L C_Small C1
U 1 1 55B6E9BA
P 1700 1800
F 0 "C1" H 1710 1870 50  0000 L CNN
F 1 "10uF" H 1710 1720 50  0000 L CNN
F 2 "DigitalCave:SM0603_VALUE" H 1700 1800 60  0001 C CNN
F 3 "" H 1700 1800 60  0000 C CNN
	1    1700 1800
	1    0    0    -1  
$EndComp
$Comp
L C_Small C2
U 1 1 55B6EBD3
P 3300 1900
F 0 "C2" H 3310 1970 50  0000 L CNN
F 1 "47uF" H 3310 1820 50  0000 L CNN
F 2 "DigitalCave:SM0603_VALUE" H 3300 1900 60  0001 C CNN
F 3 "" H 3300 1900 60  0000 C CNN
	1    3300 1900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 55B6EC9E
P 1700 2250
F 0 "#PWR02" H 1700 2000 50  0001 C CNN
F 1 "GND" H 1700 2100 50  0000 C CNN
F 2 "" H 1700 2250 60  0000 C CNN
F 3 "" H 1700 2250 60  0000 C CNN
	1    1700 2250
	1    0    0    -1  
$EndComp
NoConn ~ 3100 1850
$Comp
L MCP1702_SOT23 VR2
U 1 1 55B6EDF6
P 3650 1100
F 0 "VR2" V 3350 1100 60  0000 C CNN
F 1 "MCP1702_SOT23" V 3450 1100 60  0000 C CNN
F 2 "Housings_SOT-23_SOT-143_TSOT-6:SOT-23" H 3650 1100 60  0001 C CNN
F 3 "" H 3650 1100 60  0000 C CNN
	1    3650 1100
	0    -1   1    0   
$EndComp
$Comp
L GND #PWR03
U 1 1 55B6EFF4
P 3550 1500
F 0 "#PWR03" H 3550 1250 50  0001 C CNN
F 1 "GND" H 3550 1350 50  0000 C CNN
F 2 "" H 3550 1500 60  0000 C CNN
F 3 "" H 3550 1500 60  0000 C CNN
	1    3550 1500
	1    0    0    -1  
$EndComp
$Comp
L C_Small C3
U 1 1 55B6F011
P 3650 1900
F 0 "C3" H 3660 1970 50  0000 L CNN
F 1 "1uF" H 3660 1820 50  0000 L CNN
F 2 "DigitalCave:SM0603_VALUE" H 3650 1900 60  0001 C CNN
F 3 "" H 3650 1900 60  0000 C CNN
	1    3650 1900
	1    0    0    -1  
$EndComp
$Comp
L C_Small C4
U 1 1 55B6F0AB
P 3900 1900
F 0 "C4" H 3910 1970 50  0000 L CNN
F 1 "1uF" H 3910 1820 50  0000 L CNN
F 2 "DigitalCave:SM0603_VALUE" H 3900 1900 60  0001 C CNN
F 3 "" H 3900 1900 60  0000 C CNN
	1    3900 1900
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR04
U 1 1 55B6F34C
P 3900 1600
F 0 "#PWR04" H 3900 1450 50  0001 C CNN
F 1 "+3.3V" H 3900 1740 50  0000 C CNN
F 2 "" H 3900 1600 60  0000 C CNN
F 3 "" H 3900 1600 60  0000 C CNN
	1    3900 1600
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR05
U 1 1 55B6F3A1
P 3300 1250
F 0 "#PWR05" H 3300 1100 50  0001 C CNN
F 1 "+5V" H 3300 1390 50  0000 C CNN
F 2 "" H 3300 1250 60  0000 C CNN
F 3 "" H 3300 1250 60  0000 C CNN
	1    3300 1250
	1    0    0    -1  
$EndComp
Text Notes 2400 800  0    60   ~ 0
Power
$Comp
L ATMEGA32U4-A U1
U 1 1 55B93BC7
P 7500 3500
F 0 "U1" H 6550 5200 40  0000 C CNN
F 1 "ATMEGA32U4-A" H 8200 2000 40  0000 C CNN
F 2 "Housings_QFP:TQFP-44_10x10mm_Pitch0.8mm" H 7500 3500 35  0000 C CIN
F 3 "" H 8600 4600 60  0000 C CNN
	1    7500 3500
	1    0    0    -1  
$EndComp
Text Label 9500 3250 0    60   ~ 0
SDA
Text Label 9500 3150 0    60   ~ 0
SCL
Text Label 9500 3350 0    60   ~ 0
RADIO_TX
Text Label 9500 3450 0    60   ~ 0
RADIO_RX
Text Label 8600 3550 0    60   ~ 0
MOTOR1
Text Label 8600 3650 0    60   ~ 0
MOTOR2
Text Label 8600 3750 0    60   ~ 0
MOTOR3
Text Label 8600 3850 0    60   ~ 0
MOTOR4
$Comp
L CONN_01X02 P1
U 1 1 55B93F07
P 1250 1700
F 0 "P1" H 1250 1850 50  0000 C CNN
F 1 "BATTERY" V 1350 1700 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 1250 1700 60  0001 C CNN
F 3 "" H 1250 1700 60  0000 C CNN
	1    1250 1700
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR06
U 1 1 55B93FB7
P 1000 1600
F 0 "#PWR06" H 1000 1450 50  0001 C CNN
F 1 "+BATT" H 1000 1740 50  0000 C CNN
F 2 "" H 1000 1600 60  0000 C CNN
F 3 "" H 1000 1600 60  0000 C CNN
	1    1000 1600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 55B93FEA
P 1000 1800
F 0 "#PWR07" H 1000 1550 50  0001 C CNN
F 1 "GND" H 1000 1650 50  0000 C CNN
F 2 "" H 1000 1800 60  0000 C CNN
F 3 "" H 1000 1800 60  0000 C CNN
	1    1000 1800
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X04 P5
U 1 1 55B9415B
P 3300 3650
F 0 "P5" H 3300 3900 50  0000 C CNN
F 1 "I2C" V 3400 3650 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04" H 3300 3650 60  0001 C CNN
F 3 "" H 3300 3650 60  0000 C CNN
	1    3300 3650
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR08
U 1 1 55B94376
P 3050 3450
F 0 "#PWR08" H 3050 3300 50  0001 C CNN
F 1 "+3.3V" H 3050 3590 50  0000 C CNN
F 2 "" H 3050 3450 60  0000 C CNN
F 3 "" H 3050 3450 60  0000 C CNN
	1    3050 3450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR09
U 1 1 55B943D2
P 2900 3600
F 0 "#PWR09" H 2900 3350 50  0001 C CNN
F 1 "GND" H 2900 3450 50  0000 C CNN
F 2 "" H 2900 3600 60  0000 C CNN
F 3 "" H 2900 3600 60  0000 C CNN
	1    2900 3600
	0    1    1    0   
$EndComp
Text Label 3100 3700 2    60   ~ 0
SCL
Text Label 3100 3800 2    60   ~ 0
SDA
Text Notes 3000 3100 0    60   ~ 0
I2C
$Comp
L CONN_01X06 P2
U 1 1 55B945AF
P 1700 3600
F 0 "P2" H 1700 3950 50  0000 C CNN
F 1 "FTDI" V 1800 3600 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06" H 1700 3600 60  0001 C CNN
F 3 "" H 1700 3600 60  0000 C CNN
	1    1700 3600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR010
U 1 1 55B94612
P 1400 3350
F 0 "#PWR010" H 1400 3100 50  0001 C CNN
F 1 "GND" H 1400 3200 50  0000 C CNN
F 2 "" H 1400 3350 60  0000 C CNN
F 3 "" H 1400 3350 60  0000 C CNN
	1    1400 3350
	0    1    1    0   
$EndComp
$Comp
L +3.3V #PWR011
U 1 1 55B94681
P 1050 3400
F 0 "#PWR011" H 1050 3250 50  0001 C CNN
F 1 "+3.3V" H 1050 3540 50  0000 C CNN
F 2 "" H 1050 3400 60  0000 C CNN
F 3 "" H 1050 3400 60  0000 C CNN
	1    1050 3400
	1    0    0    -1  
$EndComp
Text Label 1500 3650 2    60   ~ 0
RADIO_TX
Text Label 1500 3750 2    60   ~ 0
RADIO_RX
$Comp
L RSMALL R20
U 1 1 55B94A64
P 9100 3450
F 0 "R20" V 9190 3445 40  0000 C CNN
F 1 "1k" V 9015 3450 40  0000 C CNN
F 2 "DigitalCave:SM0603_VALUE" V 9030 3450 30  0001 C CNN
F 3 "" H 9100 3500 30  0000 C CNN
	1    9100 3450
	0    1    1    0   
$EndComp
$Comp
L RSMALL R25
U 1 1 55B94C0E
P 9300 3650
F 0 "R25" V 9390 3645 40  0000 C CNN
F 1 "2k" V 9215 3650 40  0000 C CNN
F 2 "DigitalCave:SM0603_VALUE" V 9230 3650 30  0001 C CNN
F 3 "" H 9300 3700 30  0000 C CNN
	1    9300 3650
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR012
U 1 1 55B94DDD
P 9300 3800
F 0 "#PWR012" H 9300 3550 50  0001 C CNN
F 1 "GND" H 9300 3650 50  0000 C CNN
F 2 "" H 9300 3800 60  0000 C CNN
F 3 "" H 9300 3800 60  0000 C CNN
	1    9300 3800
	1    0    0    -1  
$EndComp
$Comp
L RSMALL R26
U 1 1 55B94FF3
P 9400 2950
F 0 "R26" V 9490 2945 40  0000 C CNN
F 1 "4.7k" V 9315 2950 40  0000 C CNN
F 2 "DigitalCave:SM0603_VALUE" V 9330 2950 30  0001 C CNN
F 3 "" H 9400 3000 30  0000 C CNN
	1    9400 2950
	-1   0    0    1   
$EndComp
$Comp
L RSMALL R21
U 1 1 55B95069
P 9150 2950
F 0 "R21" V 9240 2945 40  0000 C CNN
F 1 "4.7k" V 9065 2950 40  0000 C CNN
F 2 "DigitalCave:SM0603_VALUE" V 9080 2950 30  0001 C CNN
F 3 "" H 9150 3000 30  0000 C CNN
	1    9150 2950
	-1   0    0    1   
$EndComp
$Comp
L +3.3V #PWR013
U 1 1 55B951EB
P 9400 2650
F 0 "#PWR013" H 9400 2500 50  0001 C CNN
F 1 "+3.3V" H 9400 2790 50  0000 C CNN
F 2 "" H 9400 2650 60  0000 C CNN
F 3 "" H 9400 2650 60  0000 C CNN
	1    9400 2650
	1    0    0    -1  
$EndComp
Text Notes 1400 3100 0    60   ~ 0
Radio
$Comp
L Q_NMOS_GSD Q1
U 1 1 55B9556B
P 1550 5450
F 0 "Q1" H 1850 5500 50  0000 R CNN
F 1 "Q_NMOS_GSD" H 2200 5400 50  0000 R CNN
F 2 "Housings_SOT-23_SOT-143_TSOT-6:SOT-23" H 1750 5550 29  0001 C CNN
F 3 "" H 1550 5450 60  0000 C CNN
	1    1550 5450
	1    0    0    -1  
$EndComp
Text Label 950  5450 2    60   ~ 0
MOTOR1
$Comp
L RSMALL R1
U 1 1 55B9585F
P 1150 5450
F 0 "R1" V 1240 5445 40  0000 C CNN
F 1 "100" V 1065 5450 40  0000 C CNN
F 2 "DigitalCave:SM0603_VALUE" V 1080 5450 30  0001 C CNN
F 3 "" H 1150 5500 30  0000 C CNN
	1    1150 5450
	0    -1   -1   0   
$EndComp
$Comp
L RSMALL R3
U 1 1 55B95907
P 1300 5700
F 0 "R3" V 1390 5695 40  0000 C CNN
F 1 "10k" V 1215 5700 40  0000 C CNN
F 2 "DigitalCave:SM0603_VALUE" V 1230 5700 30  0001 C CNN
F 3 "" H 1300 5750 30  0000 C CNN
	1    1300 5700
	1    0    0    1   
$EndComp
$Comp
L GND #PWR014
U 1 1 55B95BC6
P 1650 6000
F 0 "#PWR014" H 1650 5750 50  0001 C CNN
F 1 "GND" H 1650 5850 50  0000 C CNN
F 2 "" H 1650 6000 60  0000 C CNN
F 3 "" H 1650 6000 60  0000 C CNN
	1    1650 6000
	1    0    0    -1  
$EndComp
$Comp
L DSCHSMALL D1
U 1 1 55B95C6B
P 1300 5050
F 0 "D1" V 1390 5045 40  0000 C CNN
F 1 "DSCHSMALL" V 1215 5050 40  0000 C CNN
F 2 "DigitalCave:SOD-323_DIODE" V 1230 5050 30  0001 C CNN
F 3 "" H 1300 5100 30  0000 C CNN
	1    1300 5050
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 P3
U 1 1 55B95E81
P 1900 5050
F 0 "P3" H 1900 5200 50  0000 C CNN
F 1 "MOTOR_PAD" V 2000 5050 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 1900 5050 60  0001 C CNN
F 3 "" H 1900 5050 60  0000 C CNN
	1    1900 5050
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR015
U 1 1 55B96143
P 1650 4800
F 0 "#PWR015" H 1650 4650 50  0001 C CNN
F 1 "+BATT" H 1650 4940 50  0000 C CNN
F 2 "" H 1650 4800 60  0000 C CNN
F 3 "" H 1650 4800 60  0000 C CNN
	1    1650 4800
	1    0    0    -1  
$EndComp
$Comp
L Q_NMOS_GSD Q3
U 1 1 55B966A3
P 3250 5500
F 0 "Q3" H 3550 5550 50  0000 R CNN
F 1 "Q_NMOS_GSD" H 3900 5450 50  0000 R CNN
F 2 "Housings_SOT-23_SOT-143_TSOT-6:SOT-23" H 3450 5600 29  0001 C CNN
F 3 "" H 3250 5500 60  0000 C CNN
	1    3250 5500
	1    0    0    -1  
$EndComp
Text Label 2650 5500 2    60   ~ 0
MOTOR2
$Comp
L RSMALL R5
U 1 1 55B966AA
P 2850 5500
F 0 "R5" V 2940 5495 40  0000 C CNN
F 1 "100" V 2765 5500 40  0000 C CNN
F 2 "DigitalCave:SM0603_VALUE" V 2780 5500 30  0001 C CNN
F 3 "" H 2850 5550 30  0000 C CNN
	1    2850 5500
	0    -1   -1   0   
$EndComp
$Comp
L RSMALL R7
U 1 1 55B966B0
P 3000 5750
F 0 "R7" V 3090 5745 40  0000 C CNN
F 1 "10k" V 2915 5750 40  0000 C CNN
F 2 "DigitalCave:SM0603_VALUE" V 2930 5750 30  0001 C CNN
F 3 "" H 3000 5800 30  0000 C CNN
	1    3000 5750
	1    0    0    1   
$EndComp
$Comp
L GND #PWR016
U 1 1 55B966BE
P 3350 6050
F 0 "#PWR016" H 3350 5800 50  0001 C CNN
F 1 "GND" H 3350 5900 50  0000 C CNN
F 2 "" H 3350 6050 60  0000 C CNN
F 3 "" H 3350 6050 60  0000 C CNN
	1    3350 6050
	1    0    0    -1  
$EndComp
$Comp
L DSCHSMALL D4
U 1 1 55B966C4
P 3000 5100
F 0 "D4" V 3090 5095 40  0000 C CNN
F 1 "DSCHSMALL" V 2915 5100 40  0000 C CNN
F 2 "DigitalCave:SOD-323_DIODE" V 2930 5100 30  0001 C CNN
F 3 "" H 3000 5150 30  0000 C CNN
	1    3000 5100
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 P6
U 1 1 55B966CD
P 3600 5100
F 0 "P6" H 3600 5250 50  0000 C CNN
F 1 "MOTOR_PAD" V 3700 5100 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 3600 5100 60  0001 C CNN
F 3 "" H 3600 5100 60  0000 C CNN
	1    3600 5100
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR017
U 1 1 55B966DA
P 3350 4850
F 0 "#PWR017" H 3350 4700 50  0001 C CNN
F 1 "+BATT" H 3350 4990 50  0000 C CNN
F 2 "" H 3350 4850 60  0000 C CNN
F 3 "" H 3350 4850 60  0000 C CNN
	1    3350 4850
	1    0    0    -1  
$EndComp
$Comp
L Q_NMOS_GSD Q2
U 1 1 55B96BDE
P 1550 7150
F 0 "Q2" H 1850 7200 50  0000 R CNN
F 1 "Q_NMOS_GSD" H 2200 7100 50  0000 R CNN
F 2 "Housings_SOT-23_SOT-143_TSOT-6:SOT-23" H 1750 7250 29  0001 C CNN
F 3 "" H 1550 7150 60  0000 C CNN
	1    1550 7150
	1    0    0    -1  
$EndComp
Text Label 950  7150 2    60   ~ 0
MOTOR3
$Comp
L RSMALL R2
U 1 1 55B96BE5
P 1150 7150
F 0 "R2" V 1240 7145 40  0000 C CNN
F 1 "100" V 1065 7150 40  0000 C CNN
F 2 "DigitalCave:SM0603_VALUE" V 1080 7150 30  0001 C CNN
F 3 "" H 1150 7200 30  0000 C CNN
	1    1150 7150
	0    -1   -1   0   
$EndComp
$Comp
L RSMALL R4
U 1 1 55B96BEB
P 1300 7400
F 0 "R4" V 1390 7395 40  0000 C CNN
F 1 "10k" V 1215 7400 40  0000 C CNN
F 2 "DigitalCave:SM0603_VALUE" V 1230 7400 30  0001 C CNN
F 3 "" H 1300 7450 30  0000 C CNN
	1    1300 7400
	1    0    0    1   
$EndComp
$Comp
L GND #PWR018
U 1 1 55B96BF9
P 1650 7700
F 0 "#PWR018" H 1650 7450 50  0001 C CNN
F 1 "GND" H 1650 7550 50  0000 C CNN
F 2 "" H 1650 7700 60  0000 C CNN
F 3 "" H 1650 7700 60  0000 C CNN
	1    1650 7700
	1    0    0    -1  
$EndComp
$Comp
L DSCHSMALL D2
U 1 1 55B96BFF
P 1300 6750
F 0 "D2" V 1390 6745 40  0000 C CNN
F 1 "DSCHSMALL" V 1215 6750 40  0000 C CNN
F 2 "DigitalCave:SOD-323_DIODE" V 1230 6750 30  0001 C CNN
F 3 "" H 1300 6800 30  0000 C CNN
	1    1300 6750
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 P4
U 1 1 55B96C08
P 1900 6750
F 0 "P4" H 1900 6900 50  0000 C CNN
F 1 "MOTOR_PAD" V 2000 6750 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 1900 6750 60  0001 C CNN
F 3 "" H 1900 6750 60  0000 C CNN
	1    1900 6750
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR019
U 1 1 55B96C15
P 1650 6500
F 0 "#PWR019" H 1650 6350 50  0001 C CNN
F 1 "+BATT" H 1650 6640 50  0000 C CNN
F 2 "" H 1650 6500 60  0000 C CNN
F 3 "" H 1650 6500 60  0000 C CNN
	1    1650 6500
	1    0    0    -1  
$EndComp
$Comp
L Q_NMOS_GSD Q4
U 1 1 55B96C1B
P 3250 7200
F 0 "Q4" H 3550 7250 50  0000 R CNN
F 1 "Q_NMOS_GSD" H 3900 7150 50  0000 R CNN
F 2 "Housings_SOT-23_SOT-143_TSOT-6:SOT-23" H 3450 7300 29  0001 C CNN
F 3 "" H 3250 7200 60  0000 C CNN
	1    3250 7200
	1    0    0    -1  
$EndComp
Text Label 2650 7200 2    60   ~ 0
MOTOR4
$Comp
L RSMALL R6
U 1 1 55B96C22
P 2850 7200
F 0 "R6" V 2940 7195 40  0000 C CNN
F 1 "100" V 2765 7200 40  0000 C CNN
F 2 "DigitalCave:SM0603_VALUE" V 2780 7200 30  0001 C CNN
F 3 "" H 2850 7250 30  0000 C CNN
	1    2850 7200
	0    -1   -1   0   
$EndComp
$Comp
L RSMALL R8
U 1 1 55B96C28
P 3000 7450
F 0 "R8" V 3090 7445 40  0000 C CNN
F 1 "10k" V 2915 7450 40  0000 C CNN
F 2 "DigitalCave:SM0603_VALUE" V 2930 7450 30  0001 C CNN
F 3 "" H 3000 7500 30  0000 C CNN
	1    3000 7450
	1    0    0    1   
$EndComp
$Comp
L GND #PWR020
U 1 1 55B96C36
P 3350 7750
F 0 "#PWR020" H 3350 7500 50  0001 C CNN
F 1 "GND" H 3350 7600 50  0000 C CNN
F 2 "" H 3350 7750 60  0000 C CNN
F 3 "" H 3350 7750 60  0000 C CNN
	1    3350 7750
	1    0    0    -1  
$EndComp
$Comp
L DSCHSMALL D5
U 1 1 55B96C3C
P 3000 6800
F 0 "D5" V 3090 6795 40  0000 C CNN
F 1 "DSCHSMALL" V 2915 6800 40  0000 C CNN
F 2 "DigitalCave:SOD-323_DIODE" V 2930 6800 30  0001 C CNN
F 3 "" H 3000 6850 30  0000 C CNN
	1    3000 6800
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 P7
U 1 1 55B96C45
P 3600 6800
F 0 "P7" H 3600 6950 50  0000 C CNN
F 1 "MOTOR_PAD" V 3700 6800 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 3600 6800 60  0001 C CNN
F 3 "" H 3600 6800 60  0000 C CNN
	1    3600 6800
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR021
U 1 1 55B96C52
P 3350 6550
F 0 "#PWR021" H 3350 6400 50  0001 C CNN
F 1 "+BATT" H 3350 6690 50  0000 C CNN
F 2 "" H 3350 6550 60  0000 C CNN
F 3 "" H 3350 6550 60  0000 C CNN
	1    3350 6550
	1    0    0    -1  
$EndComp
$Comp
L C_Small C6
U 1 1 55B972D6
P 7050 1500
F 0 "C6" H 7060 1570 50  0000 L CNN
F 1 "0.1u" H 7060 1420 50  0000 L CNN
F 2 "DigitalCave:SM0603_VALUE" H 7050 1500 60  0001 C CNN
F 3 "" H 7050 1500 60  0000 C CNN
	1    7050 1500
	1    0    0    -1  
$EndComp
$Comp
L C_Small C7
U 1 1 55B975E8
P 7300 1500
F 0 "C7" H 7310 1570 50  0000 L CNN
F 1 "0.1u" H 7310 1420 50  0000 L CNN
F 2 "DigitalCave:SM0603_VALUE" H 7300 1500 60  0001 C CNN
F 3 "" H 7300 1500 60  0000 C CNN
	1    7300 1500
	1    0    0    -1  
$EndComp
$Comp
L C_Small C8
U 1 1 55B9766F
P 7400 1500
F 0 "C8" H 7410 1570 50  0000 L CNN
F 1 "0.1u" H 7410 1420 50  0000 L CNN
F 2 "DigitalCave:SM0603_VALUE" H 7400 1500 60  0001 C CNN
F 3 "" H 7400 1500 60  0000 C CNN
	1    7400 1500
	1    0    0    -1  
$EndComp
$Comp
L C_Small C9
U 1 1 55B976F2
P 7650 1500
F 0 "C9" H 7660 1570 50  0000 L CNN
F 1 "0.1u" H 7660 1420 50  0000 L CNN
F 2 "DigitalCave:SM0603_VALUE" H 7650 1500 60  0001 C CNN
F 3 "" H 7650 1500 60  0000 C CNN
	1    7650 1500
	1    0    0    -1  
$EndComp
$Comp
L C_Small C10
U 1 1 55B9777B
P 7750 1500
F 0 "C10" H 7760 1570 50  0000 L CNN
F 1 "0.1u" H 7760 1420 50  0000 L CNN
F 2 "DigitalCave:SM0603_VALUE" H 7750 1500 60  0001 C CNN
F 3 "" H 7750 1500 60  0000 C CNN
	1    7750 1500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR022
U 1 1 55B984A6
P 6750 1400
F 0 "#PWR022" H 6750 1150 50  0001 C CNN
F 1 "GND" H 6750 1250 50  0000 C CNN
F 2 "" H 6750 1400 60  0000 C CNN
F 3 "" H 6750 1400 60  0000 C CNN
	1    6750 1400
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR023
U 1 1 55B9852C
P 8000 1550
F 0 "#PWR023" H 8000 1400 50  0001 C CNN
F 1 "+5V" H 8000 1690 50  0000 C CNN
F 2 "" H 8000 1550 60  0000 C CNN
F 3 "" H 8000 1550 60  0000 C CNN
	1    8000 1550
	1    0    0    -1  
$EndComp
Text Notes 2300 4700 0    60   ~ 0
Motors
NoConn ~ 1500 3850
NoConn ~ 1500 3450
$Comp
L C_Small C5
U 1 1 55B99AA1
P 6250 4550
F 0 "C5" H 6260 4620 50  0000 L CNN
F 1 "0.1u" H 6260 4470 50  0000 L CNN
F 2 "DigitalCave:SM0603_VALUE" H 6250 4550 60  0001 C CNN
F 3 "" H 6250 4550 60  0000 C CNN
	1    6250 4550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR024
U 1 1 55B99CCE
P 6250 4750
F 0 "#PWR024" H 6250 4500 50  0001 C CNN
F 1 "GND" H 6250 4600 50  0000 C CNN
F 2 "" H 6250 4750 60  0000 C CNN
F 3 "" H 6250 4750 60  0000 C CNN
	1    6250 4750
	1    0    0    -1  
$EndComp
$Comp
L RSMALL R14
U 1 1 55B9A040
P 6150 3300
F 0 "R14" V 6240 3295 40  0000 C CNN
F 1 "22" V 6065 3300 40  0000 C CNN
F 2 "DigitalCave:SM0603_VALUE" V 6080 3300 30  0001 C CNN
F 3 "" H 6150 3350 30  0000 C CNN
	1    6150 3300
	0    -1   -1   0   
$EndComp
$Comp
L RSMALL R13
U 1 1 55B9A141
P 5900 3400
F 0 "R13" V 5990 3395 40  0000 C CNN
F 1 "22" V 5815 3400 40  0000 C CNN
F 2 "DigitalCave:SM0603_VALUE" V 5830 3400 30  0001 C CNN
F 3 "" H 5900 3450 30  0000 C CNN
	1    5900 3400
	0    -1   -1   0   
$EndComp
$Comp
L USB_B P12
U 1 1 55B9A505
P 5250 3300
F 0 "P12" H 5450 3100 50  0000 C CNN
F 1 "USB_B" H 5200 3500 50  0000 C CNN
F 2 "DigitalCave:USB_MINI_B_fixed" V 5200 3200 60  0001 C CNN
F 3 "" V 5200 3200 60  0000 C CNN
	1    5250 3300
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR025
U 1 1 55B9AB27
P 5600 3100
F 0 "#PWR025" H 5600 2850 50  0001 C CNN
F 1 "GND" H 5600 2950 50  0000 C CNN
F 2 "" H 5600 3100 60  0000 C CNN
F 3 "" H 5600 3100 60  0000 C CNN
	1    5600 3100
	-1   0    0    1   
$EndComp
$Comp
L +5V #PWR026
U 1 1 55B9ABB9
P 5900 3050
F 0 "#PWR026" H 5900 2900 50  0001 C CNN
F 1 "+5V" H 5900 3190 50  0000 C CNN
F 2 "" H 5900 3050 60  0000 C CNN
F 3 "" H 5900 3050 60  0000 C CNN
	1    5900 3050
	1    0    0    -1  
$EndComp
$Comp
L CRYSTAL_SMD_4PIN X1
U 1 1 55B9ACF4
P 5950 2450
F 0 "X1" H 6100 2350 30  0000 C CNN
F 1 "CRYSTAL_SMD_4PIN" H 5750 2550 30  0000 L CNN
F 2 "DigitalCave:CRYSTAL_SMD_2.5x2" H 5950 2450 60  0001 C CNN
F 3 "" H 5950 2450 60  0000 C CNN
	1    5950 2450
	0    1    1    0   
$EndComp
$Comp
L GND #PWR027
U 1 1 55B9B1A5
P 5800 2600
F 0 "#PWR027" H 5800 2350 50  0001 C CNN
F 1 "GND" H 5800 2450 50  0000 C CNN
F 2 "" H 5800 2600 60  0000 C CNN
F 3 "" H 5800 2600 60  0000 C CNN
	1    5800 2600
	1    0    0    -1  
$EndComp
$Comp
L SW_PUSH_SMALL SW1
U 1 1 55B9B409
P 6050 1850
F 0 "SW1" H 6200 1960 30  0000 C CNN
F 1 "SW_PUSH_SMALL" H 6050 1771 30  0000 C CNN
F 2 "DigitalCave:SW_6x3" H 6050 1850 60  0001 C CNN
F 3 "" H 6050 1850 60  0000 C CNN
	1    6050 1850
	1    0    0    -1  
$EndComp
$Comp
L RSMALL R15
U 1 1 55B9B5D0
P 6300 1650
F 0 "R15" V 6390 1645 40  0000 C CNN
F 1 "10k" V 6215 1650 40  0000 C CNN
F 2 "DigitalCave:SM0603_VALUE" V 6230 1650 30  0001 C CNN
F 3 "" H 6300 1700 30  0000 C CNN
	1    6300 1650
	-1   0    0    1   
$EndComp
$Comp
L +5V #PWR028
U 1 1 55B9B7D8
P 6300 1450
F 0 "#PWR028" H 6300 1300 50  0001 C CNN
F 1 "+5V" H 6300 1590 50  0000 C CNN
F 2 "" H 6300 1450 60  0000 C CNN
F 3 "" H 6300 1450 60  0000 C CNN
	1    6300 1450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR029
U 1 1 55B9BA43
P 5800 1850
F 0 "#PWR029" H 5800 1600 50  0001 C CNN
F 1 "GND" H 5800 1700 50  0000 C CNN
F 2 "" H 5800 1850 60  0000 C CNN
F 3 "" H 5800 1850 60  0000 C CNN
	1    5800 1850
	1    0    0    -1  
$EndComp
$Comp
L SW_PUSH_SMALL SW2
U 1 1 55B9BBFE
P 9550 4150
F 0 "SW2" H 9700 4260 30  0000 C CNN
F 1 "SW_PUSH_SMALL" H 9550 4071 30  0000 C CNN
F 2 "DigitalCave:SW_6x3" H 9550 4150 60  0001 C CNN
F 3 "" H 9550 4150 60  0000 C CNN
	1    9550 4150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR030
U 1 1 55B9C065
P 9650 4350
F 0 "#PWR030" H 9650 4100 50  0001 C CNN
F 1 "GND" H 9650 4200 50  0000 C CNN
F 2 "" H 9650 4350 60  0000 C CNN
F 3 "" H 9650 4350 60  0000 C CNN
	1    9650 4350
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR031
U 1 1 55B9C1F8
P 9150 4450
F 0 "#PWR031" H 9150 4300 50  0001 C CNN
F 1 "+5V" H 9150 4590 50  0000 C CNN
F 2 "" H 9150 4450 60  0000 C CNN
F 3 "" H 9150 4450 60  0000 C CNN
	1    9150 4450
	-1   0    0    1   
$EndComp
$Comp
L RSMALL R22
U 1 1 55B9C459
P 9150 4250
F 0 "R22" V 9240 4245 40  0000 C CNN
F 1 "10k" V 9065 4250 40  0000 C CNN
F 2 "DigitalCave:SM0603_VALUE" V 9080 4250 30  0001 C CNN
F 3 "" H 9150 4300 30  0000 C CNN
	1    9150 4250
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR032
U 1 1 55B9CF25
P 7650 5300
F 0 "#PWR032" H 7650 5050 50  0001 C CNN
F 1 "GND" H 7650 5150 50  0000 C CNN
F 2 "" H 7650 5300 60  0000 C CNN
F 3 "" H 7650 5300 60  0000 C CNN
	1    7650 5300
	1    0    0    -1  
$EndComp
$Comp
L RGB_LED_COMMON_ANODE_ALT1 D10
U 1 1 55B9D0C2
P 9750 2050
F 0 "D10" H 9800 2300 50  0000 C CNN
F 1 "RGB_LED_COMMON_ANODE_ALT1" H 9750 1700 50  0000 C CNN
F 2 "DigitalCave:LED_RGB_4-PLCC_ALT1" H 9800 2050 60  0001 C CNN
F 3 "" H 9800 2050 60  0000 C CNN
	1    9750 2050
	-1   0    0    1   
$EndComp
$Comp
L RSMALL R23
U 1 1 55B9D5AD
P 9300 1900
F 0 "R23" V 9390 1895 40  0000 C CNN
F 1 "?" V 9215 1900 40  0000 C CNN
F 2 "DigitalCave:SM0603_VALUE" V 9230 1900 30  0001 C CNN
F 3 "" H 9300 1950 30  0000 C CNN
	1    9300 1900
	0    1    1    0   
$EndComp
$Comp
L RSMALL R19
U 1 1 55B9D8A4
P 9100 2050
F 0 "R19" V 9190 2045 40  0000 C CNN
F 1 "?" V 9015 2050 40  0000 C CNN
F 2 "DigitalCave:SM0603_VALUE" V 9030 2050 30  0001 C CNN
F 3 "" H 9100 2100 30  0000 C CNN
	1    9100 2050
	0    1    1    0   
$EndComp
$Comp
L RSMALL R24
U 1 1 55B9D951
P 9300 2200
F 0 "R24" V 9390 2195 40  0000 C CNN
F 1 "?" V 9215 2200 40  0000 C CNN
F 2 "DigitalCave:SM0603_VALUE" V 9230 2200 30  0001 C CNN
F 3 "" H 9300 2250 30  0000 C CNN
	1    9300 2200
	0    1    1    0   
$EndComp
$Comp
L +5V #PWR033
U 1 1 55B9E4B5
P 10100 2000
F 0 "#PWR033" H 10100 1850 50  0001 C CNN
F 1 "+5V" H 10100 2140 50  0000 C CNN
F 2 "" H 10100 2000 60  0000 C CNN
F 3 "" H 10100 2000 60  0000 C CNN
	1    10100 2000
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 P8
U 1 1 55B9F293
P 4400 5650
F 0 "P8" H 4400 5800 50  0000 C CNN
F 1 "MOTOR_PIN" V 4500 5650 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 4400 5650 60  0001 C CNN
F 3 "" H 4400 5650 60  0000 C CNN
	1    4400 5650
	-1   0    0    -1  
$EndComp
$Comp
L CONN_01X02 P13
U 1 1 55B9F483
P 5700 5650
F 0 "P13" H 5700 5800 50  0000 C CNN
F 1 "MOTOR" V 5800 5650 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 5700 5650 60  0001 C CNN
F 3 "" H 5700 5650 60  0000 C CNN
	1    5700 5650
	1    0    0    -1  
$EndComp
$Comp
L Led_Small D6
U 1 1 55B9F895
P 4900 5400
F 0 "D6" H 4850 5525 50  0000 L CNN
F 1 "Led_Small" H 4725 5300 50  0000 L CNN
F 2 "DigitalCave:SM0603_DIODE" V 4900 5400 60  0001 C CNN
F 3 "" V 4900 5400 60  0000 C CNN
	1    4900 5400
	1    0    0    -1  
$EndComp
$Comp
L RSMALL R9
U 1 1 55B9FCBB
P 5250 5400
F 0 "R9" V 5340 5395 40  0000 C CNN
F 1 "10k" V 5165 5400 40  0000 C CNN
F 2 "DigitalCave:SM0603_VALUE" V 5180 5400 30  0001 C CNN
F 3 "" H 5250 5450 30  0000 C CNN
	1    5250 5400
	0    -1   -1   0   
$EndComp
$Comp
L CONN_01X02 P9
U 1 1 55BA0DDA
P 4400 6300
F 0 "P9" H 4400 6450 50  0000 C CNN
F 1 "MOTOR_PIN" V 4500 6300 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 4400 6300 60  0001 C CNN
F 3 "" H 4400 6300 60  0000 C CNN
	1    4400 6300
	-1   0    0    -1  
$EndComp
$Comp
L CONN_01X02 P14
U 1 1 55BA0DE0
P 5700 6300
F 0 "P14" H 5700 6450 50  0000 C CNN
F 1 "MOTOR" V 5800 6300 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 5700 6300 60  0001 C CNN
F 3 "" H 5700 6300 60  0000 C CNN
	1    5700 6300
	1    0    0    -1  
$EndComp
$Comp
L Led_Small D7
U 1 1 55BA0DE8
P 4900 6050
F 0 "D7" H 4850 6175 50  0000 L CNN
F 1 "Led_Small" H 4725 5950 50  0000 L CNN
F 2 "DigitalCave:SM0603_DIODE" V 4900 6050 60  0001 C CNN
F 3 "" V 4900 6050 60  0000 C CNN
	1    4900 6050
	1    0    0    -1  
$EndComp
$Comp
L RSMALL R10
U 1 1 55BA0DEE
P 5250 6050
F 0 "R10" V 5340 6045 40  0000 C CNN
F 1 "10k" V 5165 6050 40  0000 C CNN
F 2 "DigitalCave:SM0603_VALUE" V 5180 6050 30  0001 C CNN
F 3 "" H 5250 6100 30  0000 C CNN
	1    5250 6050
	0    -1   -1   0   
$EndComp
$Comp
L CONN_01X02 P10
U 1 1 55BA0F57
P 4400 6950
F 0 "P10" H 4400 7100 50  0000 C CNN
F 1 "MOTOR_PIN" V 4500 6950 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 4400 6950 60  0001 C CNN
F 3 "" H 4400 6950 60  0000 C CNN
	1    4400 6950
	-1   0    0    -1  
$EndComp
$Comp
L CONN_01X02 P15
U 1 1 55BA0F5D
P 5700 6950
F 0 "P15" H 5700 7100 50  0000 C CNN
F 1 "MOTOR" V 5800 6950 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 5700 6950 60  0001 C CNN
F 3 "" H 5700 6950 60  0000 C CNN
	1    5700 6950
	1    0    0    -1  
$EndComp
$Comp
L Led_Small D8
U 1 1 55BA0F65
P 4900 6700
F 0 "D8" H 4850 6825 50  0000 L CNN
F 1 "Led_Small" H 4725 6600 50  0000 L CNN
F 2 "DigitalCave:SM0603_DIODE" V 4900 6700 60  0001 C CNN
F 3 "" V 4900 6700 60  0000 C CNN
	1    4900 6700
	1    0    0    -1  
$EndComp
$Comp
L RSMALL R11
U 1 1 55BA0F6B
P 5250 6700
F 0 "R11" V 5340 6695 40  0000 C CNN
F 1 "10k" V 5165 6700 40  0000 C CNN
F 2 "DigitalCave:SM0603_VALUE" V 5180 6700 30  0001 C CNN
F 3 "" H 5250 6750 30  0000 C CNN
	1    5250 6700
	0    -1   -1   0   
$EndComp
$Comp
L CONN_01X02 P11
U 1 1 55BA0F78
P 4400 7600
F 0 "P11" H 4400 7750 50  0000 C CNN
F 1 "MOTOR_PIN" V 4500 7600 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 4400 7600 60  0001 C CNN
F 3 "" H 4400 7600 60  0000 C CNN
	1    4400 7600
	-1   0    0    -1  
$EndComp
$Comp
L CONN_01X02 P16
U 1 1 55BA0F7E
P 5700 7600
F 0 "P16" H 5700 7750 50  0000 C CNN
F 1 "MOTOR" V 5800 7600 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 5700 7600 60  0001 C CNN
F 3 "" H 5700 7600 60  0000 C CNN
	1    5700 7600
	1    0    0    -1  
$EndComp
$Comp
L Led_Small D9
U 1 1 55BA0F86
P 4900 7350
F 0 "D9" H 4850 7475 50  0000 L CNN
F 1 "Led_Small" H 4725 7250 50  0000 L CNN
F 2 "DigitalCave:SM0603_DIODE" V 4900 7350 60  0001 C CNN
F 3 "" V 4900 7350 60  0000 C CNN
	1    4900 7350
	1    0    0    -1  
$EndComp
$Comp
L RSMALL R12
U 1 1 55BA0F8C
P 5250 7350
F 0 "R12" V 5340 7345 40  0000 C CNN
F 1 "10k" V 5165 7350 40  0000 C CNN
F 2 "DigitalCave:SM0603_VALUE" V 5180 7350 30  0001 C CNN
F 3 "" H 5250 7400 30  0000 C CNN
	1    5250 7350
	0    -1   -1   0   
$EndComp
Text Notes 4950 5100 0    60   ~ 0
Arms
Text Notes 7450 1050 0    60   ~ 0
MCU
$Comp
L RSMALL R16
U 1 1 55BA1C99
P 8700 5050
F 0 "R16" V 8790 5045 40  0000 C CNN
F 1 "2k" V 8615 5050 40  0000 C CNN
F 2 "DigitalCave:SM0603_VALUE" V 8630 5050 30  0001 C CNN
F 3 "" H 8700 5100 30  0000 C CNN
	1    8700 5050
	-1   0    0    1   
$EndComp
$Comp
L RSMALL R17
U 1 1 55BA1D93
P 8700 5350
F 0 "R17" V 8790 5345 40  0000 C CNN
F 1 "10k" V 8615 5350 40  0000 C CNN
F 2 "DigitalCave:SM0603_VALUE" V 8630 5350 30  0001 C CNN
F 3 "" H 8700 5400 30  0000 C CNN
	1    8700 5350
	-1   0    0    1   
$EndComp
$Comp
L RSMALL R18
U 1 1 55BA209B
P 8900 4850
F 0 "R18" V 8990 4845 40  0000 C CNN
F 1 "10k" V 8815 4850 40  0000 C CNN
F 2 "DigitalCave:SM0603_VALUE" V 8830 4850 30  0001 C CNN
F 3 "" H 8900 4900 30  0000 C CNN
	1    8900 4850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1700 1200 1700 1700
Wire Wire Line
	1700 1600 1800 1600
Connection ~ 1700 1600
Wire Wire Line
	2000 1600 2100 1600
Wire Wire Line
	2050 1600 2050 1350
Wire Wire Line
	2050 1350 2450 1350
Connection ~ 2050 1600
Wire Wire Line
	2650 1350 3300 1350
Wire Wire Line
	3300 1250 3300 1800
Wire Wire Line
	3300 1600 3100 1600
Wire Wire Line
	3100 1700 3650 1700
Connection ~ 3300 1600
Wire Wire Line
	1700 1900 1700 2250
Wire Wire Line
	3300 2150 3300 2000
Wire Wire Line
	2050 1850 2050 2150
Wire Wire Line
	2050 1850 2100 1850
Wire Wire Line
	3650 1500 3650 1800
Connection ~ 3300 1700
Connection ~ 3650 1700
Wire Wire Line
	3650 2150 3650 2000
Wire Wire Line
	1700 2150 3900 2150
Connection ~ 3300 2150
Wire Wire Line
	3750 1500 3750 1700
Wire Wire Line
	3750 1700 3900 1700
Wire Wire Line
	3900 1600 3900 1800
Wire Wire Line
	3900 2150 3900 2000
Connection ~ 3650 2150
Connection ~ 1700 2150
Connection ~ 2050 2150
Connection ~ 3900 1700
Connection ~ 3300 1350
Wire Wire Line
	1000 1600 1000 1650
Wire Wire Line
	1000 1650 1050 1650
Wire Wire Line
	1000 1800 1000 1750
Wire Wire Line
	1000 1750 1050 1750
Wire Wire Line
	3050 3450 3050 3500
Wire Wire Line
	3050 3500 3100 3500
Wire Wire Line
	2900 3600 3100 3600
Wire Wire Line
	1400 3350 1500 3350
Wire Wire Line
	1050 3550 1500 3550
Wire Wire Line
	9200 3450 9500 3450
Wire Wire Line
	9300 3450 9300 3550
Connection ~ 9300 3450
Wire Wire Line
	9000 3450 8600 3450
Wire Wire Line
	9300 3750 9300 3800
Wire Wire Line
	9500 3350 8600 3350
Wire Wire Line
	8600 3150 9500 3150
Wire Wire Line
	8600 3250 9500 3250
Wire Wire Line
	9150 3050 9150 3150
Connection ~ 9150 3150
Wire Wire Line
	9400 3050 9400 3250
Connection ~ 9400 3250
Wire Wire Line
	9150 2850 9150 2750
Wire Wire Line
	9150 2750 9400 2750
Wire Wire Line
	9400 2650 9400 2850
Connection ~ 9400 2750
Wire Wire Line
	1050 3400 1050 3550
Wire Wire Line
	1300 5800 1300 5900
Wire Wire Line
	1300 5900 1650 5900
Wire Wire Line
	1650 5650 1650 6000
Wire Wire Line
	1250 5450 1350 5450
Wire Wire Line
	1300 5450 1300 5600
Connection ~ 1300 5450
Wire Wire Line
	1050 5450 950  5450
Connection ~ 1650 5900
Wire Wire Line
	1650 5100 1650 5250
Wire Wire Line
	1650 5200 1300 5200
Wire Wire Line
	1300 5200 1300 5150
Wire Wire Line
	1650 5100 1700 5100
Connection ~ 1650 5200
Wire Wire Line
	1650 5000 1700 5000
Wire Wire Line
	1650 4800 1650 5000
Wire Wire Line
	1650 4900 1300 4900
Wire Wire Line
	1300 4900 1300 4950
Connection ~ 1650 4900
Wire Wire Line
	3000 5850 3000 5950
Wire Wire Line
	3000 5950 3350 5950
Wire Wire Line
	3350 5700 3350 6050
Wire Wire Line
	2950 5500 3050 5500
Wire Wire Line
	3000 5500 3000 5650
Connection ~ 3000 5500
Wire Wire Line
	2750 5500 2650 5500
Connection ~ 3350 5950
Wire Wire Line
	3350 5150 3350 5300
Wire Wire Line
	3350 5250 3000 5250
Wire Wire Line
	3000 5250 3000 5200
Wire Wire Line
	3350 5150 3400 5150
Connection ~ 3350 5250
Wire Wire Line
	3350 5050 3400 5050
Wire Wire Line
	3350 4850 3350 5050
Wire Wire Line
	3350 4950 3000 4950
Wire Wire Line
	3000 4950 3000 5000
Connection ~ 3350 4950
Wire Wire Line
	1300 7500 1300 7600
Wire Wire Line
	1300 7600 1650 7600
Wire Wire Line
	1650 7350 1650 7700
Wire Wire Line
	1250 7150 1350 7150
Wire Wire Line
	1300 7150 1300 7300
Connection ~ 1300 7150
Wire Wire Line
	1050 7150 950  7150
Connection ~ 1650 7600
Wire Wire Line
	1650 6800 1650 6950
Wire Wire Line
	1650 6900 1300 6900
Wire Wire Line
	1300 6900 1300 6850
Wire Wire Line
	1650 6800 1700 6800
Connection ~ 1650 6900
Wire Wire Line
	1650 6700 1700 6700
Wire Wire Line
	1650 6500 1650 6700
Wire Wire Line
	1650 6600 1300 6600
Wire Wire Line
	1300 6600 1300 6650
Connection ~ 1650 6600
Wire Wire Line
	3000 7550 3000 7650
Wire Wire Line
	3000 7650 3350 7650
Wire Wire Line
	3350 7400 3350 7750
Wire Wire Line
	2950 7200 3050 7200
Wire Wire Line
	3000 7200 3000 7350
Connection ~ 3000 7200
Wire Wire Line
	2750 7200 2650 7200
Connection ~ 3350 7650
Wire Wire Line
	3350 6850 3350 7000
Wire Wire Line
	3350 6950 3000 6950
Wire Wire Line
	3000 6950 3000 6900
Wire Wire Line
	3350 6850 3400 6850
Connection ~ 3350 6950
Wire Wire Line
	3350 6750 3400 6750
Wire Wire Line
	3350 6550 3350 6750
Wire Wire Line
	3350 6650 3000 6650
Wire Wire Line
	3000 6650 3000 6700
Connection ~ 3350 6650
Wire Wire Line
	7050 1600 7050 1700
Wire Wire Line
	7050 1650 8000 1650
Wire Wire Line
	8000 1650 8000 1550
Connection ~ 7050 1650
Wire Wire Line
	7300 1600 7300 1700
Connection ~ 7300 1650
Wire Wire Line
	7400 1600 7400 1700
Connection ~ 7400 1650
Wire Wire Line
	7650 1600 7650 1700
Connection ~ 7650 1650
Wire Wire Line
	7750 1600 7750 1700
Connection ~ 7750 1650
Wire Wire Line
	7050 1400 7050 1300
Wire Wire Line
	6750 1300 7750 1300
Wire Wire Line
	7750 1300 7750 1400
Wire Wire Line
	7650 1400 7650 1300
Connection ~ 7650 1300
Wire Wire Line
	7400 1400 7400 1300
Connection ~ 7400 1300
Wire Wire Line
	7300 1400 7300 1300
Connection ~ 7300 1300
Wire Wire Line
	6750 1300 6750 1400
Connection ~ 7050 1300
Wire Wire Line
	6250 4450 6250 4350
Wire Wire Line
	6250 4350 6350 4350
Wire Wire Line
	6250 4650 6250 4750
Wire Wire Line
	6350 3400 6000 3400
Wire Wire Line
	6250 3300 6350 3300
Wire Wire Line
	5550 3400 5800 3400
Wire Wire Line
	6050 3300 5550 3300
Wire Wire Line
	5700 3150 6350 3150
Wire Wire Line
	5700 3150 5700 3500
Wire Wire Line
	5700 3500 5550 3500
Wire Wire Line
	5550 3200 5600 3200
Wire Wire Line
	5600 3200 5600 3100
Wire Wire Line
	5900 3050 5900 3150
Connection ~ 5900 3150
Wire Wire Line
	5950 2250 5950 2200
Wire Wire Line
	5950 2200 6250 2200
Wire Wire Line
	6250 2200 6250 2350
Wire Wire Line
	6250 2350 6350 2350
Wire Wire Line
	5950 2650 5950 2700
Wire Wire Line
	5950 2700 6250 2700
Wire Wire Line
	6250 2700 6250 2550
Wire Wire Line
	6250 2550 6350 2550
Wire Wire Line
	5850 2400 5800 2400
Wire Wire Line
	5800 2400 5800 2600
Wire Wire Line
	5850 2500 5800 2500
Connection ~ 5800 2500
Wire Wire Line
	6150 1950 6350 1950
Wire Wire Line
	6300 1750 6300 1950
Connection ~ 6300 1950
Wire Wire Line
	6300 1450 6300 1550
Wire Wire Line
	5950 1750 5800 1750
Wire Wire Line
	5800 1750 5800 1850
Wire Wire Line
	8600 4050 9450 4050
Wire Wire Line
	9650 4250 9650 4350
Wire Wire Line
	9150 4150 9150 4050
Connection ~ 9150 4050
Wire Wire Line
	9150 4350 9150 4450
Wire Wire Line
	7100 5100 7100 5200
Wire Wire Line
	7100 5200 7650 5200
Wire Wire Line
	7650 5100 7650 5300
Wire Wire Line
	7550 5100 7550 5200
Connection ~ 7550 5200
Wire Wire Line
	7450 5100 7450 5200
Connection ~ 7450 5200
Wire Wire Line
	7350 5100 7350 5200
Connection ~ 7350 5200
Connection ~ 7650 5200
Wire Wire Line
	9200 2050 9500 2050
Wire Wire Line
	9400 2200 9500 2200
Wire Wire Line
	9400 1900 9500 1900
Wire Wire Line
	9000 2050 8600 2050
Wire Wire Line
	8600 1950 8950 1950
Wire Wire Line
	8950 1950 8950 1900
Wire Wire Line
	8950 1900 9200 1900
Wire Wire Line
	8600 2150 8950 2150
Wire Wire Line
	8950 2150 8950 2200
Wire Wire Line
	8950 2200 9200 2200
Wire Wire Line
	10100 2000 10100 2050
Wire Wire Line
	10100 2050 10050 2050
Wire Wire Line
	4600 5600 5500 5600
Wire Wire Line
	4600 5700 5500 5700
Wire Wire Line
	5000 5400 5150 5400
Wire Wire Line
	4800 5400 4650 5400
Wire Wire Line
	4650 5400 4650 5700
Connection ~ 4650 5700
Wire Wire Line
	5350 5400 5450 5400
Wire Wire Line
	5450 5400 5450 5600
Connection ~ 5450 5600
Wire Wire Line
	4600 6250 5500 6250
Wire Wire Line
	4600 6350 5500 6350
Wire Wire Line
	5000 6050 5150 6050
Wire Wire Line
	4800 6050 4650 6050
Wire Wire Line
	4650 6050 4650 6350
Connection ~ 4650 6350
Wire Wire Line
	5350 6050 5450 6050
Wire Wire Line
	5450 6050 5450 6250
Connection ~ 5450 6250
Wire Wire Line
	4600 6900 5500 6900
Wire Wire Line
	4600 7000 5500 7000
Wire Wire Line
	5000 6700 5150 6700
Wire Wire Line
	4800 6700 4650 6700
Wire Wire Line
	4650 6700 4650 7000
Connection ~ 4650 7000
Wire Wire Line
	5350 6700 5450 6700
Wire Wire Line
	5450 6700 5450 6900
Connection ~ 5450 6900
Wire Wire Line
	4600 7550 5500 7550
Wire Wire Line
	4600 7650 5500 7650
Wire Wire Line
	5000 7350 5150 7350
Wire Wire Line
	4800 7350 4650 7350
Wire Wire Line
	4650 7350 4650 7650
Connection ~ 4650 7650
Wire Wire Line
	5350 7350 5450 7350
Wire Wire Line
	5450 7350 5450 7550
Connection ~ 5450 7550
Wire Wire Line
	8700 5150 8700 5250
Wire Wire Line
	8600 4850 8800 4850
Wire Wire Line
	8700 4950 8700 4850
Connection ~ 8700 4850
$Comp
L GND #PWR034
U 1 1 55BA261D
P 8700 5550
F 0 "#PWR034" H 8700 5300 50  0001 C CNN
F 1 "GND" H 8700 5400 50  0000 C CNN
F 2 "" H 8700 5550 60  0000 C CNN
F 3 "" H 8700 5550 60  0000 C CNN
	1    8700 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 5450 8700 5550
$Comp
L +BATT #PWR035
U 1 1 55BA28DB
P 9100 4850
F 0 "#PWR035" H 9100 4700 50  0001 C CNN
F 1 "+BATT" H 9100 4990 50  0000 C CNN
F 2 "" H 9100 4850 60  0000 C CNN
F 3 "" H 9100 4850 60  0000 C CNN
	1    9100 4850
	0    1    1    0   
$EndComp
Wire Wire Line
	9100 4850 9000 4850
$EndSCHEMATC
