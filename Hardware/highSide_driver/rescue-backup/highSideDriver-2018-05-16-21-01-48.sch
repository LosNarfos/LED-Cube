EESchema Schematic File Version 2
LIBS:cosi_IC
LIBS:power
LIBS:device
LIBS:switches
LIBS:relays
LIBS:motors
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
LIBS:highSideDriver-cache
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
L Q_PMOS_DGS Q?
U 1 1 5AF55278
P 5700 1400
F 0 "Q?" H 5600 1550 50  0000 L CNN
F 1 "IRF9310PbF" V 5950 1200 50  0000 L CNN
F 2 "" H 5900 1500 50  0001 C CNN
F 3 "" H 5700 1400 50  0001 C CNN
	1    5700 1400
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5AF552C7
P 5300 1400
F 0 "R?" V 5380 1400 50  0000 C CNN
F 1 "R" V 5300 1400 50  0000 C CNN
F 2 "" V 5230 1400 50  0001 C CNN
F 3 "" H 5300 1400 50  0001 C CNN
	1    5300 1400
	0    1    1    0   
$EndComp
$Comp
L CP C?
U 1 1 5AF55300
P 2950 1900
F 0 "C?" H 2975 2000 50  0000 L CNN
F 1 "CP" H 2975 1800 50  0000 L CNN
F 2 "" H 2988 1750 50  0001 C CNN
F 3 "" H 2950 1900 50  0001 C CNN
	1    2950 1900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5AF55428
P 1950 2100
F 0 "#PWR?" H 1950 1850 50  0001 C CNN
F 1 "GND" H 1950 1950 50  0000 C CNN
F 2 "" H 1950 2100 50  0001 C CNN
F 3 "" H 1950 2100 50  0001 C CNN
	1    1950 2100
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 5AF555A2
P 5800 950
F 0 "#PWR?" H 5800 800 50  0001 C CNN
F 1 "+5V" H 5800 1090 50  0000 C CNN
F 2 "" H 5800 950 50  0001 C CNN
F 3 "" H 5800 950 50  0001 C CNN
	1    5800 950 
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x08 J?
U 1 1 5AF55754
P 10150 5500
F 0 "J?" H 10150 5900 50  0000 C CNN
F 1 "Conn_01x08" H 10150 5000 50  0000 C CNN
F 2 "" H 10150 5500 50  0001 C CNN
F 3 "" H 10150 5500 50  0001 C CNN
	1    10150 5500
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5AF5A9E1
P 5800 1950
F 0 "R?" V 5880 1950 50  0000 C CNN
F 1 "120" V 5800 1950 50  0000 C CNN
F 2 "" V 5730 1950 50  0001 C CNN
F 3 "" H 5800 1950 50  0001 C CNN
	1    5800 1950
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR?
U 1 1 5AF5AB71
P 5800 2200
F 0 "#PWR?" H 5800 1950 50  0001 C CNN
F 1 "GND" H 5800 2050 50  0000 C CNN
F 2 "" H 5800 2200 50  0001 C CNN
F 3 "" H 5800 2200 50  0001 C CNN
	1    5800 2200
	1    0    0    -1  
$EndComp
Text GLabel 6000 1750 2    40   Output ~ 0
LED_ANODE_0
Text GLabel 9700 5200 0    40   Input ~ 0
LED_LAYER_0
$Comp
L R R?
U 1 1 5AF5CA92
P 5100 1200
F 0 "R?" V 5180 1200 50  0000 C CNN
F 1 "R" V 5100 1200 50  0000 C CNN
F 2 "" V 5030 1200 50  0001 C CNN
F 3 "" H 5100 1200 50  0001 C CNN
	1    5100 1200
	-1   0    0    1   
$EndComp
$Comp
L +5V #PWR?
U 1 1 5AF5CA9A
P 5100 950
F 0 "#PWR?" H 5100 800 50  0001 C CNN
F 1 "+5V" H 5100 1090 50  0000 C CNN
F 2 "" H 5100 950 50  0001 C CNN
F 3 "" H 5100 950 50  0001 C CNN
	1    5100 950 
	1    0    0    -1  
$EndComp
Text GLabel 4050 4400 2    40   Output ~ 0
LAYER_0
$Comp
L +5V #PWR?
U 1 1 5AF5D33E
P 3350 3900
F 0 "#PWR?" H 3350 3750 50  0001 C CNN
F 1 "+5V" H 3350 4040 50  0000 C CNN
F 2 "" H 3350 3900 50  0001 C CNN
F 3 "" H 3350 3900 50  0001 C CNN
	1    3350 3900
	1    0    0    -1  
$EndComp
$Comp
L CP C?
U 1 1 5AF5D808
P 3200 1900
F 0 "C?" H 3225 2000 50  0000 L CNN
F 1 "CP" H 3225 1800 50  0000 L CNN
F 2 "" H 3238 1750 50  0001 C CNN
F 3 "" H 3200 1900 50  0001 C CNN
	1    3200 1900
	1    0    0    -1  
$EndComp
$Comp
L CP C?
U 1 1 5AF5D84A
P 3450 1900
F 0 "C?" H 3475 2000 50  0000 L CNN
F 1 "CP" H 3475 1800 50  0000 L CNN
F 2 "" H 3488 1750 50  0001 C CNN
F 3 "" H 3450 1900 50  0001 C CNN
	1    3450 1900
	1    0    0    -1  
$EndComp
$Comp
L CP C?
U 1 1 5AF5D88B
P 3700 1900
F 0 "C?" H 3725 2000 50  0000 L CNN
F 1 "CP" H 3725 1800 50  0000 L CNN
F 2 "" H 3738 1750 50  0001 C CNN
F 3 "" H 3700 1900 50  0001 C CNN
	1    3700 1900
	1    0    0    -1  
$EndComp
$Comp
L CP C?
U 1 1 5AF5DA13
P 1950 1900
F 0 "C?" H 1975 2000 50  0000 L CNN
F 1 "CP" H 1975 1800 50  0000 L CNN
F 2 "" H 1988 1750 50  0001 C CNN
F 3 "" H 1950 1900 50  0001 C CNN
	1    1950 1900
	1    0    0    -1  
$EndComp
$Comp
L CP C?
U 1 1 5AF5DA19
P 2200 1900
F 0 "C?" H 2225 2000 50  0000 L CNN
F 1 "CP" H 2225 1800 50  0000 L CNN
F 2 "" H 2238 1750 50  0001 C CNN
F 3 "" H 2200 1900 50  0001 C CNN
	1    2200 1900
	1    0    0    -1  
$EndComp
$Comp
L CP C?
U 1 1 5AF5DA1F
P 2450 1900
F 0 "C?" H 2475 2000 50  0000 L CNN
F 1 "CP" H 2475 1800 50  0000 L CNN
F 2 "" H 2488 1750 50  0001 C CNN
F 3 "" H 2450 1900 50  0001 C CNN
	1    2450 1900
	1    0    0    -1  
$EndComp
$Comp
L CP C?
U 1 1 5AF5DA25
P 2700 1900
F 0 "C?" H 2725 2000 50  0000 L CNN
F 1 "CP" H 2725 1800 50  0000 L CNN
F 2 "" H 2738 1750 50  0001 C CNN
F 3 "" H 2700 1900 50  0001 C CNN
	1    2700 1900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5AF5DDEE
P 2200 2100
F 0 "#PWR?" H 2200 1850 50  0001 C CNN
F 1 "GND" H 2200 1950 50  0000 C CNN
F 2 "" H 2200 2100 50  0001 C CNN
F 3 "" H 2200 2100 50  0001 C CNN
	1    2200 2100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5AF5DE35
P 2450 2100
F 0 "#PWR?" H 2450 1850 50  0001 C CNN
F 1 "GND" H 2450 1950 50  0000 C CNN
F 2 "" H 2450 2100 50  0001 C CNN
F 3 "" H 2450 2100 50  0001 C CNN
	1    2450 2100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5AF5DE7C
P 2700 2100
F 0 "#PWR?" H 2700 1850 50  0001 C CNN
F 1 "GND" H 2700 1950 50  0000 C CNN
F 2 "" H 2700 2100 50  0001 C CNN
F 3 "" H 2700 2100 50  0001 C CNN
	1    2700 2100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5AF5DEC3
P 2950 2100
F 0 "#PWR?" H 2950 1850 50  0001 C CNN
F 1 "GND" H 2950 1950 50  0000 C CNN
F 2 "" H 2950 2100 50  0001 C CNN
F 3 "" H 2950 2100 50  0001 C CNN
	1    2950 2100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5AF5DF0A
P 3200 2100
F 0 "#PWR?" H 3200 1850 50  0001 C CNN
F 1 "GND" H 3200 1950 50  0000 C CNN
F 2 "" H 3200 2100 50  0001 C CNN
F 3 "" H 3200 2100 50  0001 C CNN
	1    3200 2100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5AF5DF51
P 3450 2100
F 0 "#PWR?" H 3450 1850 50  0001 C CNN
F 1 "GND" H 3450 1950 50  0000 C CNN
F 2 "" H 3450 2100 50  0001 C CNN
F 3 "" H 3450 2100 50  0001 C CNN
	1    3450 2100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5AF5DF98
P 3700 2100
F 0 "#PWR?" H 3700 1850 50  0001 C CNN
F 1 "GND" H 3700 1950 50  0000 C CNN
F 2 "" H 3700 2100 50  0001 C CNN
F 3 "" H 3700 2100 50  0001 C CNN
	1    3700 2100
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 5AF5E1C9
P 1950 1700
F 0 "#PWR?" H 1950 1550 50  0001 C CNN
F 1 "+5V" H 1950 1840 50  0000 C CNN
F 2 "" H 1950 1700 50  0001 C CNN
F 3 "" H 1950 1700 50  0001 C CNN
	1    1950 1700
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 5AF5E255
P 2200 1700
F 0 "#PWR?" H 2200 1550 50  0001 C CNN
F 1 "+5V" H 2200 1840 50  0000 C CNN
F 2 "" H 2200 1700 50  0001 C CNN
F 3 "" H 2200 1700 50  0001 C CNN
	1    2200 1700
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 5AF5E29C
P 2450 1700
F 0 "#PWR?" H 2450 1550 50  0001 C CNN
F 1 "+5V" H 2450 1840 50  0000 C CNN
F 2 "" H 2450 1700 50  0001 C CNN
F 3 "" H 2450 1700 50  0001 C CNN
	1    2450 1700
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 5AF5E2E3
P 2700 1700
F 0 "#PWR?" H 2700 1550 50  0001 C CNN
F 1 "+5V" H 2700 1840 50  0000 C CNN
F 2 "" H 2700 1700 50  0001 C CNN
F 3 "" H 2700 1700 50  0001 C CNN
	1    2700 1700
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 5AF5E32A
P 2950 1700
F 0 "#PWR?" H 2950 1550 50  0001 C CNN
F 1 "+5V" H 2950 1840 50  0000 C CNN
F 2 "" H 2950 1700 50  0001 C CNN
F 3 "" H 2950 1700 50  0001 C CNN
	1    2950 1700
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 5AF5E371
P 3200 1700
F 0 "#PWR?" H 3200 1550 50  0001 C CNN
F 1 "+5V" H 3200 1840 50  0000 C CNN
F 2 "" H 3200 1700 50  0001 C CNN
F 3 "" H 3200 1700 50  0001 C CNN
	1    3200 1700
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 5AF5E3B8
P 3450 1700
F 0 "#PWR?" H 3450 1550 50  0001 C CNN
F 1 "+5V" H 3450 1840 50  0000 C CNN
F 2 "" H 3450 1700 50  0001 C CNN
F 3 "" H 3450 1700 50  0001 C CNN
	1    3450 1700
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 5AF5E3FF
P 3700 1700
F 0 "#PWR?" H 3700 1550 50  0001 C CNN
F 1 "+5V" H 3700 1840 50  0000 C CNN
F 2 "" H 3700 1700 50  0001 C CNN
F 3 "" H 3700 1700 50  0001 C CNN
	1    3700 1700
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5AF5E853
P 1500 1900
F 0 "R?" V 1580 1900 50  0000 C CNN
F 1 "100k" V 1500 1900 50  0000 C CNN
F 2 "" V 1430 1900 50  0001 C CNN
F 3 "" H 1500 1900 50  0001 C CNN
	1    1500 1900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5AF5E9B7
P 1500 2100
F 0 "#PWR?" H 1500 1850 50  0001 C CNN
F 1 "GND" H 1500 1950 50  0000 C CNN
F 2 "" H 1500 2100 50  0001 C CNN
F 3 "" H 1500 2100 50  0001 C CNN
	1    1500 2100
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 5AF5EA01
P 1500 1700
F 0 "#PWR?" H 1500 1550 50  0001 C CNN
F 1 "+5V" H 1500 1840 50  0000 C CNN
F 2 "" H 1500 1700 50  0001 C CNN
F 3 "" H 1500 1700 50  0001 C CNN
	1    1500 1700
	1    0    0    -1  
$EndComp
Text GLabel 4050 4500 2    40   Output ~ 0
LAYER_1
Text GLabel 4050 4600 2    40   Output ~ 0
LAYER_2
Text GLabel 9700 5300 0    40   Input ~ 0
LED_LAYER_1
Text GLabel 9700 5400 0    40   Input ~ 0
LED_LAYER_2
Text GLabel 9700 5500 0    40   Input ~ 0
LED_LAYER_3
Text GLabel 9700 5600 0    40   Input ~ 0
LED_LAYER_4
Text GLabel 9700 5700 0    40   Input ~ 0
LED_LAYER_5
Text GLabel 9700 5800 0    40   Input ~ 0
LED_LAYER_6
Text GLabel 9700 5900 0    40   Input ~ 0
LED_LAYER_7
Text GLabel 4050 4700 2    40   Output ~ 0
LAYER_3
Text GLabel 4050 4800 2    40   Output ~ 0
LAYER_4
Text GLabel 4050 4900 2    40   Output ~ 0
LAYER_5
Text GLabel 4050 5000 2    40   Output ~ 0
LAYER_6
Text GLabel 4050 5100 2    40   Output ~ 0
LAYER_7
Text GLabel 5000 1400 0    40   Input ~ 0
LAYER_0
$Comp
L Conn_01x10 J?
U 1 1 5AF64385
P 1300 3750
F 0 "J?" H 1300 4250 50  0000 C CNN
F 1 "Conn_01x10" H 1300 3150 50  0000 C CNN
F 2 "" H 1300 3750 50  0001 C CNN
F 3 "" H 1300 3750 50  0001 C CNN
	1    1300 3750
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR?
U 1 1 5AF65BA9
P 1700 4200
F 0 "#PWR?" H 1700 3950 50  0001 C CNN
F 1 "GND" H 1700 4050 50  0000 C CNN
F 2 "" H 1700 4200 50  0001 C CNN
F 3 "" H 1700 4200 50  0001 C CNN
	1    1700 4200
	1    0    0    -1  
$EndComp
$Comp
L TPIC6C595 U?
U 1 1 5AF686BA
P 3350 4750
F 0 "U?" H 3000 5250 50  0000 C CNN
F 1 "TPIC6C595" H 3600 5250 50  0000 C CNN
F 2 "" H 4000 4050 50  0001 C CNN
F 3 "" H 3350 4650 50  0001 C CNN
	1    3350 4750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5AF6AD81
P 3350 5400
F 0 "#PWR?" H 3350 5150 50  0001 C CNN
F 1 "GND" H 3350 5250 50  0000 C CNN
F 2 "" H 3350 5400 50  0001 C CNN
F 3 "" H 3350 5400 50  0001 C CNN
	1    3350 5400
	1    0    0    -1  
$EndComp
$Comp
L Q_PMOS_DGS Q?
U 1 1 5AF6B749
P 7150 1400
F 0 "Q?" H 7050 1550 50  0000 L CNN
F 1 "IRF9310PbF" V 7400 1200 50  0000 L CNN
F 2 "" H 7350 1500 50  0001 C CNN
F 3 "" H 7150 1400 50  0001 C CNN
	1    7150 1400
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5AF6B74F
P 6750 1400
F 0 "R?" V 6830 1400 50  0000 C CNN
F 1 "R" V 6750 1400 50  0000 C CNN
F 2 "" V 6680 1400 50  0001 C CNN
F 3 "" H 6750 1400 50  0001 C CNN
	1    6750 1400
	0    1    1    0   
$EndComp
$Comp
L +5V #PWR?
U 1 1 5AF6B755
P 7250 950
F 0 "#PWR?" H 7250 800 50  0001 C CNN
F 1 "+5V" H 7250 1090 50  0000 C CNN
F 2 "" H 7250 950 50  0001 C CNN
F 3 "" H 7250 950 50  0001 C CNN
	1    7250 950 
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5AF6B75B
P 7250 1950
F 0 "R?" V 7330 1950 50  0000 C CNN
F 1 "120" V 7250 1950 50  0000 C CNN
F 2 "" V 7180 1950 50  0001 C CNN
F 3 "" H 7250 1950 50  0001 C CNN
	1    7250 1950
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR?
U 1 1 5AF6B761
P 7250 2200
F 0 "#PWR?" H 7250 1950 50  0001 C CNN
F 1 "GND" H 7250 2050 50  0000 C CNN
F 2 "" H 7250 2200 50  0001 C CNN
F 3 "" H 7250 2200 50  0001 C CNN
	1    7250 2200
	1    0    0    -1  
$EndComp
Text GLabel 7450 1750 2    40   Output ~ 0
LED_ANODE_0
$Comp
L R R?
U 1 1 5AF6B768
P 6550 1200
F 0 "R?" V 6630 1200 50  0000 C CNN
F 1 "R" V 6550 1200 50  0000 C CNN
F 2 "" V 6480 1200 50  0001 C CNN
F 3 "" H 6550 1200 50  0001 C CNN
	1    6550 1200
	-1   0    0    1   
$EndComp
$Comp
L +5V #PWR?
U 1 1 5AF6B76E
P 6550 950
F 0 "#PWR?" H 6550 800 50  0001 C CNN
F 1 "+5V" H 6550 1090 50  0000 C CNN
F 2 "" H 6550 950 50  0001 C CNN
F 3 "" H 6550 950 50  0001 C CNN
	1    6550 950 
	1    0    0    -1  
$EndComp
Text GLabel 6450 1400 0    40   Input ~ 0
LAYER_1
$Comp
L Q_PMOS_DGS Q?
U 1 1 5AF6BAB8
P 8600 1400
F 0 "Q?" H 8500 1550 50  0000 L CNN
F 1 "IRF9310PbF" V 8850 1200 50  0000 L CNN
F 2 "" H 8800 1500 50  0001 C CNN
F 3 "" H 8600 1400 50  0001 C CNN
	1    8600 1400
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5AF6BABE
P 8200 1400
F 0 "R?" V 8280 1400 50  0000 C CNN
F 1 "R" V 8200 1400 50  0000 C CNN
F 2 "" V 8130 1400 50  0001 C CNN
F 3 "" H 8200 1400 50  0001 C CNN
	1    8200 1400
	0    1    1    0   
$EndComp
$Comp
L +5V #PWR?
U 1 1 5AF6BAC4
P 8700 950
F 0 "#PWR?" H 8700 800 50  0001 C CNN
F 1 "+5V" H 8700 1090 50  0000 C CNN
F 2 "" H 8700 950 50  0001 C CNN
F 3 "" H 8700 950 50  0001 C CNN
	1    8700 950 
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5AF6BACA
P 8700 1950
F 0 "R?" V 8780 1950 50  0000 C CNN
F 1 "120" V 8700 1950 50  0000 C CNN
F 2 "" V 8630 1950 50  0001 C CNN
F 3 "" H 8700 1950 50  0001 C CNN
	1    8700 1950
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR?
U 1 1 5AF6BAD0
P 8700 2200
F 0 "#PWR?" H 8700 1950 50  0001 C CNN
F 1 "GND" H 8700 2050 50  0000 C CNN
F 2 "" H 8700 2200 50  0001 C CNN
F 3 "" H 8700 2200 50  0001 C CNN
	1    8700 2200
	1    0    0    -1  
$EndComp
Text GLabel 8900 1750 2    40   Output ~ 0
LED_ANODE_0
$Comp
L R R?
U 1 1 5AF6BAD7
P 8000 1200
F 0 "R?" V 8080 1200 50  0000 C CNN
F 1 "R" V 8000 1200 50  0000 C CNN
F 2 "" V 7930 1200 50  0001 C CNN
F 3 "" H 8000 1200 50  0001 C CNN
	1    8000 1200
	-1   0    0    1   
$EndComp
$Comp
L +5V #PWR?
U 1 1 5AF6BADD
P 8000 950
F 0 "#PWR?" H 8000 800 50  0001 C CNN
F 1 "+5V" H 8000 1090 50  0000 C CNN
F 2 "" H 8000 950 50  0001 C CNN
F 3 "" H 8000 950 50  0001 C CNN
	1    8000 950 
	1    0    0    -1  
$EndComp
Text GLabel 7900 1400 0    40   Input ~ 0
LAYER_2
$Comp
L Q_PMOS_DGS Q?
U 1 1 5AF6BAEE
P 10050 1400
F 0 "Q?" H 9950 1550 50  0000 L CNN
F 1 "IRF9310PbF" V 10300 1200 50  0000 L CNN
F 2 "" H 10250 1500 50  0001 C CNN
F 3 "" H 10050 1400 50  0001 C CNN
	1    10050 1400
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5AF6BAF4
P 9650 1400
F 0 "R?" V 9730 1400 50  0000 C CNN
F 1 "R" V 9650 1400 50  0000 C CNN
F 2 "" V 9580 1400 50  0001 C CNN
F 3 "" H 9650 1400 50  0001 C CNN
	1    9650 1400
	0    1    1    0   
$EndComp
$Comp
L +5V #PWR?
U 1 1 5AF6BAFA
P 10150 950
F 0 "#PWR?" H 10150 800 50  0001 C CNN
F 1 "+5V" H 10150 1090 50  0000 C CNN
F 2 "" H 10150 950 50  0001 C CNN
F 3 "" H 10150 950 50  0001 C CNN
	1    10150 950 
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5AF6BB00
P 10150 1950
F 0 "R?" V 10230 1950 50  0000 C CNN
F 1 "120" V 10150 1950 50  0000 C CNN
F 2 "" V 10080 1950 50  0001 C CNN
F 3 "" H 10150 1950 50  0001 C CNN
	1    10150 1950
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR?
U 1 1 5AF6BB06
P 10150 2200
F 0 "#PWR?" H 10150 1950 50  0001 C CNN
F 1 "GND" H 10150 2050 50  0000 C CNN
F 2 "" H 10150 2200 50  0001 C CNN
F 3 "" H 10150 2200 50  0001 C CNN
	1    10150 2200
	1    0    0    -1  
$EndComp
Text GLabel 10350 1750 2    40   Output ~ 0
LED_ANODE_0
$Comp
L R R?
U 1 1 5AF6BB0D
P 9450 1200
F 0 "R?" V 9530 1200 50  0000 C CNN
F 1 "R" V 9450 1200 50  0000 C CNN
F 2 "" V 9380 1200 50  0001 C CNN
F 3 "" H 9450 1200 50  0001 C CNN
	1    9450 1200
	-1   0    0    1   
$EndComp
$Comp
L +5V #PWR?
U 1 1 5AF6BB13
P 9450 950
F 0 "#PWR?" H 9450 800 50  0001 C CNN
F 1 "+5V" H 9450 1090 50  0000 C CNN
F 2 "" H 9450 950 50  0001 C CNN
F 3 "" H 9450 950 50  0001 C CNN
	1    9450 950 
	1    0    0    -1  
$EndComp
Text GLabel 9350 1400 0    40   Input ~ 0
LAYER_3
Wire Wire Line
	5450 1400 5500 1400
Wire Wire Line
	5800 950  5800 1200
Wire Wire Line
	1950 2100 1950 2050
Wire Wire Line
	5000 1400 5150 1400
Wire Wire Line
	5800 1600 5800 1800
Wire Wire Line
	5800 1750 6000 1750
Connection ~ 5800 1750
Wire Wire Line
	5800 2100 5800 2200
Wire Wire Line
	9700 5200 9950 5200
Wire Wire Line
	9950 5300 9700 5300
Wire Wire Line
	9700 5400 9950 5400
Wire Wire Line
	9950 5500 9700 5500
Wire Wire Line
	9700 5600 9950 5600
Wire Wire Line
	9950 5700 9700 5700
Wire Wire Line
	9700 5800 9950 5800
Wire Wire Line
	9950 5900 9700 5900
Wire Wire Line
	5100 950  5100 1050
Wire Wire Line
	5100 1350 5100 1400
Connection ~ 5100 1400
Wire Wire Line
	3850 4400 4050 4400
Wire Wire Line
	3350 3900 3350 4200
Wire Wire Line
	3700 2100 3700 2050
Wire Wire Line
	3450 2100 3450 2050
Wire Wire Line
	3200 2100 3200 2050
Wire Wire Line
	2950 2100 2950 2050
Wire Wire Line
	2700 2100 2700 2050
Wire Wire Line
	2450 2100 2450 2050
Wire Wire Line
	2200 2100 2200 2050
Wire Wire Line
	1950 1750 1950 1700
Wire Wire Line
	3700 1700 3700 1750
Wire Wire Line
	3450 1700 3450 1750
Wire Wire Line
	3200 1700 3200 1750
Wire Wire Line
	2950 1700 2950 1750
Wire Wire Line
	2700 1700 2700 1750
Wire Wire Line
	2450 1700 2450 1750
Wire Wire Line
	2200 1700 2200 1750
Wire Wire Line
	1500 1750 1500 1700
Wire Wire Line
	1500 2050 1500 2100
Wire Wire Line
	3850 4500 4050 4500
Wire Wire Line
	4050 4600 3850 4600
Wire Wire Line
	3850 4700 4050 4700
Wire Wire Line
	4050 4800 3850 4800
Wire Wire Line
	3850 4900 4050 4900
Wire Wire Line
	4050 5000 3850 5000
Wire Wire Line
	3850 5100 4050 5100
Wire Wire Line
	1500 3350 1700 3350
Wire Wire Line
	1700 3350 1700 4200
Wire Wire Line
	1500 3550 1700 3550
Connection ~ 1700 3550
Wire Wire Line
	1500 3750 1700 3750
Connection ~ 1700 3750
Wire Wire Line
	1500 3950 1700 3950
Connection ~ 1700 3950
Wire Wire Line
	3350 5400 3350 5300
Wire Wire Line
	6900 1400 6950 1400
Wire Wire Line
	7250 950  7250 1200
Wire Wire Line
	6450 1400 6600 1400
Wire Wire Line
	7250 1600 7250 1800
Wire Wire Line
	7250 1750 7450 1750
Connection ~ 7250 1750
Wire Wire Line
	7250 2100 7250 2200
Wire Wire Line
	6550 950  6550 1050
Wire Wire Line
	6550 1350 6550 1400
Connection ~ 6550 1400
Wire Wire Line
	8350 1400 8400 1400
Wire Wire Line
	8700 950  8700 1200
Wire Wire Line
	7900 1400 8050 1400
Wire Wire Line
	8700 1600 8700 1800
Wire Wire Line
	8700 1750 8900 1750
Connection ~ 8700 1750
Wire Wire Line
	8700 2100 8700 2200
Wire Wire Line
	8000 950  8000 1050
Wire Wire Line
	8000 1350 8000 1400
Connection ~ 8000 1400
Wire Wire Line
	9800 1400 9850 1400
Wire Wire Line
	10150 950  10150 1200
Wire Wire Line
	9350 1400 9500 1400
Wire Wire Line
	10150 1600 10150 1800
Wire Wire Line
	10150 1750 10350 1750
Connection ~ 10150 1750
Wire Wire Line
	10150 2100 10150 2200
Wire Wire Line
	9450 950  9450 1050
Wire Wire Line
	9450 1350 9450 1400
Connection ~ 9450 1400
Wire Wire Line
	1500 4150 1700 4150
Connection ~ 1700 4150
$Comp
L Conn_01x10 J?
U 1 1 5AF8C470
P 1300 5650
F 0 "J?" H 1300 6150 50  0000 C CNN
F 1 "Conn_01x10" H 1300 5050 50  0000 C CNN
F 2 "" H 1300 5650 50  0001 C CNN
F 3 "" H 1300 5650 50  0001 C CNN
	1    1300 5650
	-1   0    0    1   
$EndComp
Wire Wire Line
	1700 6050 1500 6050
Wire Wire Line
	1700 5850 1500 5850
Wire Wire Line
	1700 5650 1500 5650
Wire Wire Line
	1700 5450 1500 5450
Wire Wire Line
	1500 5250 1700 5250
Wire Wire Line
	1700 5250 1700 6100
Connection ~ 1700 5450
Connection ~ 1700 5650
Connection ~ 1700 5850
$Comp
L GND #PWR?
U 1 1 5AF8CFFF
P 1700 6100
F 0 "#PWR?" H 1700 5850 50  0001 C CNN
F 1 "GND" H 1700 5950 50  0000 C CNN
F 2 "" H 1700 6100 50  0001 C CNN
F 3 "" H 1700 6100 50  0001 C CNN
	1    1700 6100
	1    0    0    -1  
$EndComp
Connection ~ 1700 6050
Wire Wire Line
	1950 3250 1950 4400
Wire Wire Line
	1950 4400 2850 4400
Wire Wire Line
	2850 4500 1950 4500
Wire Wire Line
	1950 4500 1950 5150
Wire Wire Line
	1950 5150 1500 5150
Wire Wire Line
	1500 3450 2050 3450
Wire Wire Line
	2050 3450 2050 5350
Wire Wire Line
	2050 4800 2850 4800
Wire Wire Line
	1500 3650 2150 3650
Wire Wire Line
	2150 4700 2850 4700
Wire Wire Line
	1500 3850 2250 3850
Wire Wire Line
	2250 3850 2250 5750
Wire Wire Line
	2250 5000 2850 5000
Wire Wire Line
	2850 5100 2350 5100
Wire Wire Line
	2050 5350 1500 5350
Connection ~ 2050 4800
Wire Wire Line
	2150 5550 1500 5550
Wire Wire Line
	2150 3650 2150 5550
Connection ~ 2150 4700
Wire Wire Line
	2250 5750 1500 5750
Connection ~ 2250 5000
Wire Wire Line
	2350 5950 1500 5950
Wire Wire Line
	2350 4050 2350 5950
Connection ~ 2350 5100
Wire Wire Line
	1950 3250 1500 3250
Wire Wire Line
	1500 4050 2350 4050
Text Notes 1050 3850 1    60   ~ 0
Serial In
Text Notes 1050 5800 1    60   ~ 0
Serial Out
$Comp
L Q_PMOS_DGS Q?
U 1 1 5AF9D9A1
P 5700 3350
F 0 "Q?" H 5600 3500 50  0000 L CNN
F 1 "IRF9310PbF" V 5950 3150 50  0000 L CNN
F 2 "" H 5900 3450 50  0001 C CNN
F 3 "" H 5700 3350 50  0001 C CNN
	1    5700 3350
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5AF9D9A7
P 5300 3350
F 0 "R?" V 5380 3350 50  0000 C CNN
F 1 "R" V 5300 3350 50  0000 C CNN
F 2 "" V 5230 3350 50  0001 C CNN
F 3 "" H 5300 3350 50  0001 C CNN
	1    5300 3350
	0    1    1    0   
$EndComp
$Comp
L +5V #PWR?
U 1 1 5AF9D9AD
P 5800 2900
F 0 "#PWR?" H 5800 2750 50  0001 C CNN
F 1 "+5V" H 5800 3040 50  0000 C CNN
F 2 "" H 5800 2900 50  0001 C CNN
F 3 "" H 5800 2900 50  0001 C CNN
	1    5800 2900
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5AF9D9B3
P 5800 3900
F 0 "R?" V 5880 3900 50  0000 C CNN
F 1 "120" V 5800 3900 50  0000 C CNN
F 2 "" V 5730 3900 50  0001 C CNN
F 3 "" H 5800 3900 50  0001 C CNN
	1    5800 3900
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR?
U 1 1 5AF9D9B9
P 5800 4150
F 0 "#PWR?" H 5800 3900 50  0001 C CNN
F 1 "GND" H 5800 4000 50  0000 C CNN
F 2 "" H 5800 4150 50  0001 C CNN
F 3 "" H 5800 4150 50  0001 C CNN
	1    5800 4150
	1    0    0    -1  
$EndComp
Text GLabel 6000 3700 2    40   Output ~ 0
LED_ANODE_0
$Comp
L R R?
U 1 1 5AF9D9C0
P 5100 3150
F 0 "R?" V 5180 3150 50  0000 C CNN
F 1 "R" V 5100 3150 50  0000 C CNN
F 2 "" V 5030 3150 50  0001 C CNN
F 3 "" H 5100 3150 50  0001 C CNN
	1    5100 3150
	-1   0    0    1   
$EndComp
$Comp
L +5V #PWR?
U 1 1 5AF9D9C6
P 5100 2900
F 0 "#PWR?" H 5100 2750 50  0001 C CNN
F 1 "+5V" H 5100 3040 50  0000 C CNN
F 2 "" H 5100 2900 50  0001 C CNN
F 3 "" H 5100 2900 50  0001 C CNN
	1    5100 2900
	1    0    0    -1  
$EndComp
Text GLabel 5000 3350 0    40   Input ~ 0
LAYER_4
$Comp
L Q_PMOS_DGS Q?
U 1 1 5AF9D9CD
P 7150 3350
F 0 "Q?" H 7050 3500 50  0000 L CNN
F 1 "IRF9310PbF" V 7400 3150 50  0000 L CNN
F 2 "" H 7350 3450 50  0001 C CNN
F 3 "" H 7150 3350 50  0001 C CNN
	1    7150 3350
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5AF9D9D3
P 6750 3350
F 0 "R?" V 6830 3350 50  0000 C CNN
F 1 "R" V 6750 3350 50  0000 C CNN
F 2 "" V 6680 3350 50  0001 C CNN
F 3 "" H 6750 3350 50  0001 C CNN
	1    6750 3350
	0    1    1    0   
$EndComp
$Comp
L +5V #PWR?
U 1 1 5AF9D9D9
P 7250 2900
F 0 "#PWR?" H 7250 2750 50  0001 C CNN
F 1 "+5V" H 7250 3040 50  0000 C CNN
F 2 "" H 7250 2900 50  0001 C CNN
F 3 "" H 7250 2900 50  0001 C CNN
	1    7250 2900
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5AF9D9DF
P 7250 3900
F 0 "R?" V 7330 3900 50  0000 C CNN
F 1 "120" V 7250 3900 50  0000 C CNN
F 2 "" V 7180 3900 50  0001 C CNN
F 3 "" H 7250 3900 50  0001 C CNN
	1    7250 3900
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR?
U 1 1 5AF9D9E5
P 7250 4150
F 0 "#PWR?" H 7250 3900 50  0001 C CNN
F 1 "GND" H 7250 4000 50  0000 C CNN
F 2 "" H 7250 4150 50  0001 C CNN
F 3 "" H 7250 4150 50  0001 C CNN
	1    7250 4150
	1    0    0    -1  
$EndComp
Text GLabel 7450 3700 2    40   Output ~ 0
LED_ANODE_0
$Comp
L R R?
U 1 1 5AF9D9EC
P 6550 3150
F 0 "R?" V 6630 3150 50  0000 C CNN
F 1 "R" V 6550 3150 50  0000 C CNN
F 2 "" V 6480 3150 50  0001 C CNN
F 3 "" H 6550 3150 50  0001 C CNN
	1    6550 3150
	-1   0    0    1   
$EndComp
$Comp
L +5V #PWR?
U 1 1 5AF9D9F2
P 6550 2900
F 0 "#PWR?" H 6550 2750 50  0001 C CNN
F 1 "+5V" H 6550 3040 50  0000 C CNN
F 2 "" H 6550 2900 50  0001 C CNN
F 3 "" H 6550 2900 50  0001 C CNN
	1    6550 2900
	1    0    0    -1  
$EndComp
Text GLabel 6450 3350 0    40   Input ~ 0
LAYER_5
$Comp
L Q_PMOS_DGS Q?
U 1 1 5AF9D9F9
P 8600 3350
F 0 "Q?" H 8500 3500 50  0000 L CNN
F 1 "IRF9310PbF" V 8850 3150 50  0000 L CNN
F 2 "" H 8800 3450 50  0001 C CNN
F 3 "" H 8600 3350 50  0001 C CNN
	1    8600 3350
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5AF9D9FF
P 8200 3350
F 0 "R?" V 8280 3350 50  0000 C CNN
F 1 "R" V 8200 3350 50  0000 C CNN
F 2 "" V 8130 3350 50  0001 C CNN
F 3 "" H 8200 3350 50  0001 C CNN
	1    8200 3350
	0    1    1    0   
$EndComp
$Comp
L +5V #PWR?
U 1 1 5AF9DA05
P 8700 2900
F 0 "#PWR?" H 8700 2750 50  0001 C CNN
F 1 "+5V" H 8700 3040 50  0000 C CNN
F 2 "" H 8700 2900 50  0001 C CNN
F 3 "" H 8700 2900 50  0001 C CNN
	1    8700 2900
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5AF9DA0B
P 8700 3900
F 0 "R?" V 8780 3900 50  0000 C CNN
F 1 "120" V 8700 3900 50  0000 C CNN
F 2 "" V 8630 3900 50  0001 C CNN
F 3 "" H 8700 3900 50  0001 C CNN
	1    8700 3900
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR?
U 1 1 5AF9DA11
P 8700 4150
F 0 "#PWR?" H 8700 3900 50  0001 C CNN
F 1 "GND" H 8700 4000 50  0000 C CNN
F 2 "" H 8700 4150 50  0001 C CNN
F 3 "" H 8700 4150 50  0001 C CNN
	1    8700 4150
	1    0    0    -1  
$EndComp
Text GLabel 8900 3700 2    40   Output ~ 0
LED_ANODE_0
$Comp
L R R?
U 1 1 5AF9DA18
P 8000 3150
F 0 "R?" V 8080 3150 50  0000 C CNN
F 1 "R" V 8000 3150 50  0000 C CNN
F 2 "" V 7930 3150 50  0001 C CNN
F 3 "" H 8000 3150 50  0001 C CNN
	1    8000 3150
	-1   0    0    1   
$EndComp
$Comp
L +5V #PWR?
U 1 1 5AF9DA1E
P 8000 2900
F 0 "#PWR?" H 8000 2750 50  0001 C CNN
F 1 "+5V" H 8000 3040 50  0000 C CNN
F 2 "" H 8000 2900 50  0001 C CNN
F 3 "" H 8000 2900 50  0001 C CNN
	1    8000 2900
	1    0    0    -1  
$EndComp
Text GLabel 7900 3350 0    40   Input ~ 0
LAYER_6
$Comp
L Q_PMOS_DGS Q?
U 1 1 5AF9DA25
P 10050 3350
F 0 "Q?" H 9950 3500 50  0000 L CNN
F 1 "IRF9310PbF" V 10300 3150 50  0000 L CNN
F 2 "" H 10250 3450 50  0001 C CNN
F 3 "" H 10050 3350 50  0001 C CNN
	1    10050 3350
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5AF9DA2B
P 9650 3350
F 0 "R?" V 9730 3350 50  0000 C CNN
F 1 "R" V 9650 3350 50  0000 C CNN
F 2 "" V 9580 3350 50  0001 C CNN
F 3 "" H 9650 3350 50  0001 C CNN
	1    9650 3350
	0    1    1    0   
$EndComp
$Comp
L +5V #PWR?
U 1 1 5AF9DA31
P 10150 2900
F 0 "#PWR?" H 10150 2750 50  0001 C CNN
F 1 "+5V" H 10150 3040 50  0000 C CNN
F 2 "" H 10150 2900 50  0001 C CNN
F 3 "" H 10150 2900 50  0001 C CNN
	1    10150 2900
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5AF9DA37
P 10150 3900
F 0 "R?" V 10230 3900 50  0000 C CNN
F 1 "120" V 10150 3900 50  0000 C CNN
F 2 "" V 10080 3900 50  0001 C CNN
F 3 "" H 10150 3900 50  0001 C CNN
	1    10150 3900
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR?
U 1 1 5AF9DA3D
P 10150 4150
F 0 "#PWR?" H 10150 3900 50  0001 C CNN
F 1 "GND" H 10150 4000 50  0000 C CNN
F 2 "" H 10150 4150 50  0001 C CNN
F 3 "" H 10150 4150 50  0001 C CNN
	1    10150 4150
	1    0    0    -1  
$EndComp
Text GLabel 10350 3700 2    40   Output ~ 0
LED_ANODE_0
$Comp
L R R?
U 1 1 5AF9DA44
P 9450 3150
F 0 "R?" V 9530 3150 50  0000 C CNN
F 1 "R" V 9450 3150 50  0000 C CNN
F 2 "" V 9380 3150 50  0001 C CNN
F 3 "" H 9450 3150 50  0001 C CNN
	1    9450 3150
	-1   0    0    1   
$EndComp
$Comp
L +5V #PWR?
U 1 1 5AF9DA4A
P 9450 2900
F 0 "#PWR?" H 9450 2750 50  0001 C CNN
F 1 "+5V" H 9450 3040 50  0000 C CNN
F 2 "" H 9450 2900 50  0001 C CNN
F 3 "" H 9450 2900 50  0001 C CNN
	1    9450 2900
	1    0    0    -1  
$EndComp
Text GLabel 9350 3350 0    40   Input ~ 0
LAYER_7
Wire Wire Line
	5450 3350 5500 3350
Wire Wire Line
	5800 2900 5800 3150
Wire Wire Line
	5000 3350 5150 3350
Wire Wire Line
	5800 3550 5800 3750
Wire Wire Line
	5800 3700 6000 3700
Connection ~ 5800 3700
Wire Wire Line
	5800 4050 5800 4150
Wire Wire Line
	5100 2900 5100 3000
Wire Wire Line
	5100 3300 5100 3350
Connection ~ 5100 3350
Wire Wire Line
	6900 3350 6950 3350
Wire Wire Line
	7250 2900 7250 3150
Wire Wire Line
	6450 3350 6600 3350
Wire Wire Line
	7250 3550 7250 3750
Wire Wire Line
	7250 3700 7450 3700
Connection ~ 7250 3700
Wire Wire Line
	7250 4050 7250 4150
Wire Wire Line
	6550 2900 6550 3000
Wire Wire Line
	6550 3300 6550 3350
Connection ~ 6550 3350
Wire Wire Line
	8350 3350 8400 3350
Wire Wire Line
	8700 2900 8700 3150
Wire Wire Line
	7900 3350 8050 3350
Wire Wire Line
	8700 3550 8700 3750
Wire Wire Line
	8700 3700 8900 3700
Connection ~ 8700 3700
Wire Wire Line
	8700 4050 8700 4150
Wire Wire Line
	8000 2900 8000 3000
Wire Wire Line
	8000 3300 8000 3350
Connection ~ 8000 3350
Wire Wire Line
	9800 3350 9850 3350
Wire Wire Line
	10150 2900 10150 3150
Wire Wire Line
	9350 3350 9500 3350
Wire Wire Line
	10150 3550 10150 3750
Wire Wire Line
	10150 3700 10350 3700
Connection ~ 10150 3700
Wire Wire Line
	10150 4050 10150 4150
Wire Wire Line
	9450 2900 9450 3000
Wire Wire Line
	9450 3300 9450 3350
Connection ~ 9450 3350
Text Notes 10400 5850 1    60   ~ 0
To LED Anode
$Comp
L C C?
U 1 1 5AFA6AC5
P 3050 4000
F 0 "C?" H 3075 4100 50  0000 L CNN
F 1 "C" H 3075 3900 50  0000 L CNN
F 2 "" H 3088 3850 50  0001 C CNN
F 3 "" H 3050 4000 50  0001 C CNN
	1    3050 4000
	0    1    1    0   
$EndComp
$Comp
L GND #PWR?
U 1 1 5AFA6F08
P 2800 4100
F 0 "#PWR?" H 2800 3850 50  0001 C CNN
F 1 "GND" H 2800 3950 50  0000 C CNN
F 2 "" H 2800 4100 50  0001 C CNN
F 3 "" H 2800 4100 50  0001 C CNN
	1    2800 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 4100 2800 4000
Wire Wire Line
	2800 4000 2900 4000
Wire Wire Line
	3350 4000 3200 4000
Connection ~ 3350 4000
$EndSCHEMATC
