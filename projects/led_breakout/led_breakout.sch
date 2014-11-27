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
LIBS:special
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
EELAYER 27 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date "24 nov 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L RGB_LED_COMMON_ANODE_ALT1 D1
U 1 1 547382EC
P 2200 2000
F 0 "D1" H 2250 2250 50  0000 C CNN
F 1 "RGB_LED_COMMON_ANODE_ALT1" H 2200 1650 50  0000 C CNN
F 2 "~" H 2250 2000 60  0000 C CNN
F 3 "~" H 2250 2000 60  0000 C CNN
	1    2200 2000
	1    0    0    -1  
$EndComp
$Comp
L RGB_LED_COMMON_ANODE_ALT1 D2
U 1 1 547382F9
P 2200 2700
F 0 "D2" H 2250 2950 50  0000 C CNN
F 1 "RGB_LED_COMMON_ANODE_ALT1" H 2200 2350 50  0000 C CNN
F 2 "~" H 2250 2700 60  0000 C CNN
F 3 "~" H 2250 2700 60  0000 C CNN
	1    2200 2700
	1    0    0    -1  
$EndComp
$Comp
L RGB_LED_COMMON_ANODE_ALT1 D3
U 1 1 54738313
P 2200 3400
F 0 "D3" H 2250 3650 50  0000 C CNN
F 1 "RGB_LED_COMMON_ANODE_ALT1" H 2200 3050 50  0000 C CNN
F 2 "~" H 2250 3400 60  0000 C CNN
F 3 "~" H 2250 3400 60  0000 C CNN
	1    2200 3400
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 54738359
P 2700 1850
F 0 "R1" V 2780 1850 40  0000 C CNN
F 1 "1k" V 2707 1851 40  0000 C CNN
F 2 "~" V 2630 1850 30  0000 C CNN
F 3 "~" H 2700 1850 30  0000 C CNN
	1    2700 1850
	0    -1   -1   0   
$EndComp
$Comp
L R R2
U 1 1 5473836B
P 2700 2000
F 0 "R2" V 2780 2000 40  0000 C CNN
F 1 "1k" V 2707 2001 40  0000 C CNN
F 2 "~" V 2630 2000 30  0000 C CNN
F 3 "~" H 2700 2000 30  0000 C CNN
	1    2700 2000
	0    -1   -1   0   
$EndComp
$Comp
L R R3
U 1 1 54738371
P 2700 2150
F 0 "R3" V 2780 2150 40  0000 C CNN
F 1 "1k" V 2707 2151 40  0000 C CNN
F 2 "~" V 2630 2150 30  0000 C CNN
F 3 "~" H 2700 2150 30  0000 C CNN
	1    2700 2150
	0    -1   -1   0   
$EndComp
$Comp
L R R4
U 1 1 54738377
P 2700 2550
F 0 "R4" V 2780 2550 40  0000 C CNN
F 1 "1k" V 2707 2551 40  0000 C CNN
F 2 "~" V 2630 2550 30  0000 C CNN
F 3 "~" H 2700 2550 30  0000 C CNN
	1    2700 2550
	0    -1   -1   0   
$EndComp
$Comp
L R R5
U 1 1 5473837D
P 2700 2700
F 0 "R5" V 2780 2700 40  0000 C CNN
F 1 "1k" V 2707 2701 40  0000 C CNN
F 2 "~" V 2630 2700 30  0000 C CNN
F 3 "~" H 2700 2700 30  0000 C CNN
	1    2700 2700
	0    -1   -1   0   
$EndComp
$Comp
L R R6
U 1 1 54738383
P 2700 2850
F 0 "R6" V 2780 2850 40  0000 C CNN
F 1 "1k" V 2707 2851 40  0000 C CNN
F 2 "~" V 2630 2850 30  0000 C CNN
F 3 "~" H 2700 2850 30  0000 C CNN
	1    2700 2850
	0    -1   -1   0   
$EndComp
$Comp
L R R7
U 1 1 54738389
P 2700 3250
F 0 "R7" V 2780 3250 40  0000 C CNN
F 1 "1k" V 2707 3251 40  0000 C CNN
F 2 "~" V 2630 3250 30  0000 C CNN
F 3 "~" H 2700 3250 30  0000 C CNN
	1    2700 3250
	0    -1   -1   0   
$EndComp
$Comp
L R R8
U 1 1 5473838F
P 2700 3400
F 0 "R8" V 2780 3400 40  0000 C CNN
F 1 "1k" V 2707 3401 40  0000 C CNN
F 2 "~" V 2630 3400 30  0000 C CNN
F 3 "~" H 2700 3400 30  0000 C CNN
	1    2700 3400
	0    -1   -1   0   
$EndComp
$Comp
L R R9
U 1 1 54738395
P 2700 3550
F 0 "R9" V 2780 3550 40  0000 C CNN
F 1 "1k" V 2707 3551 40  0000 C CNN
F 2 "~" V 2630 3550 30  0000 C CNN
F 3 "~" H 2700 3550 30  0000 C CNN
	1    2700 3550
	0    -1   -1   0   
$EndComp
$Comp
L R R10
U 1 1 5473839B
P 2700 3950
F 0 "R10" V 2780 3950 40  0000 C CNN
F 1 "1k" V 2707 3951 40  0000 C CNN
F 2 "~" V 2630 3950 30  0000 C CNN
F 3 "~" H 2700 3950 30  0000 C CNN
	1    2700 3950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1900 2000 1800 2000
Wire Wire Line
	1800 3400 1900 3400
Wire Wire Line
	1900 2700 1800 2700
Connection ~ 1800 2700
Connection ~ 1800 3400
$Comp
L CONN_1 P1
U 1 1 54738431
P 1650 2000
F 0 "P1" H 1730 2000 40  0000 L CNN
F 1 "CONN_1" H 1650 2055 30  0001 C CNN
F 2 "" H 1650 2000 60  0000 C CNN
F 3 "" H 1650 2000 60  0000 C CNN
	1    1650 2000
	-1   0    0    1   
$EndComp
Wire Wire Line
	1900 4100 1800 4100
$Comp
L R R12
U 1 1 547383A7
P 2700 4250
F 0 "R12" V 2780 4250 40  0000 C CNN
F 1 "1k" V 2707 4251 40  0000 C CNN
F 2 "~" V 2630 4250 30  0000 C CNN
F 3 "~" H 2700 4250 30  0000 C CNN
	1    2700 4250
	0    -1   -1   0   
$EndComp
$Comp
L R R11
U 1 1 547383A1
P 2700 4100
F 0 "R11" V 2780 4100 40  0000 C CNN
F 1 "1k" V 2707 4101 40  0000 C CNN
F 2 "~" V 2630 4100 30  0000 C CNN
F 3 "~" H 2700 4100 30  0000 C CNN
	1    2700 4100
	0    -1   -1   0   
$EndComp
$Comp
L RGB_LED_COMMON_ANODE_ALT1 D4
U 1 1 54738319
P 2200 4100
F 0 "D4" H 2250 4350 50  0000 C CNN
F 1 "RGB_LED_COMMON_ANODE_ALT1" H 2200 3750 50  0000 C CNN
F 2 "~" H 2250 4100 60  0000 C CNN
F 3 "~" H 2250 4100 60  0000 C CNN
	1    2200 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 4100 1800 2000
$Comp
L CONN_4 P2
U 1 1 547389D1
P 3900 2000
F 0 "P2" V 3850 2000 50  0000 C CNN
F 1 "CONN_4" V 3950 2000 50  0000 C CNN
F 2 "" H 3900 2000 60  0000 C CNN
F 3 "" H 3900 2000 60  0000 C CNN
	1    3900 2000
	1    0    0    -1  
$EndComp
$Comp
L CONN_4 P3
U 1 1 547389DE
P 3900 2450
F 0 "P3" V 3850 2450 50  0000 C CNN
F 1 "CONN_4" V 3950 2450 50  0000 C CNN
F 2 "" H 3900 2450 60  0000 C CNN
F 3 "" H 3900 2450 60  0000 C CNN
	1    3900 2450
	1    0    0    -1  
$EndComp
$Comp
L CONN_4 P4
U 1 1 547389E4
P 3900 2900
F 0 "P4" V 3850 2900 50  0000 C CNN
F 1 "CONN_4" V 3950 2900 50  0000 C CNN
F 2 "" H 3900 2900 60  0000 C CNN
F 3 "" H 3900 2900 60  0000 C CNN
	1    3900 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 1850 2950 1850
Wire Wire Line
	3550 1950 3050 1950
Wire Wire Line
	3050 1950 3050 2550
Wire Wire Line
	3050 2550 2950 2550
Wire Wire Line
	3100 2050 3550 2050
Wire Wire Line
	3100 2050 3100 3250
Wire Wire Line
	3100 3250 2950 3250
Wire Wire Line
	3550 2150 3150 2150
Wire Wire Line
	3150 2150 3150 3950
Wire Wire Line
	3150 3950 2950 3950
Wire Wire Line
	3550 2300 3200 2300
Wire Wire Line
	3200 2300 3200 2000
Wire Wire Line
	3200 2000 2950 2000
Wire Wire Line
	3550 2400 3200 2400
Wire Wire Line
	3200 2400 3200 2700
Wire Wire Line
	3200 2700 2950 2700
Wire Wire Line
	3550 2500 3250 2500
Wire Wire Line
	3250 2500 3250 3400
Wire Wire Line
	3250 3400 2950 3400
Wire Wire Line
	3550 2600 3300 2600
Wire Wire Line
	3300 2600 3300 4100
Wire Wire Line
	3300 4100 2950 4100
Wire Wire Line
	3550 2750 3350 2750
Wire Wire Line
	3350 2750 3350 2200
Wire Wire Line
	3350 2200 2950 2200
Wire Wire Line
	2950 2200 2950 2150
Wire Wire Line
	3550 2850 2950 2850
Wire Wire Line
	3550 2950 3350 2950
Wire Wire Line
	3350 2950 3350 3550
Wire Wire Line
	3350 3550 2950 3550
Wire Wire Line
	3550 3050 3400 3050
Wire Wire Line
	3400 3050 3400 4250
Wire Wire Line
	3400 4250 2950 4250
$EndSCHEMATC