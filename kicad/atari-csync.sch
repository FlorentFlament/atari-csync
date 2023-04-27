EESchema Schematic File Version 4
EELAYER 30 0
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
L Device:R R2
U 1 1 644AF523
P 3950 4150
F 0 "R2" H 4020 4196 50  0000 L CNN
F 1 "3.9K" H 4020 4105 50  0000 L CNN
F 2 "" V 3880 4150 50  0001 C CNN
F 3 "~" H 3950 4150 50  0001 C CNN
	1    3950 4150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 644B211C
P 3950 3750
F 0 "R1" H 4020 3796 50  0000 L CNN
F 1 "2.2K" H 4020 3705 50  0000 L CNN
F 2 "" V 3880 3750 50  0001 C CNN
F 3 "~" H 3950 3750 50  0001 C CNN
	1    3950 3750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 644B2407
P 3950 3050
F 0 "R4" H 4020 3096 50  0000 L CNN
F 1 "3.9K" H 4020 3005 50  0000 L CNN
F 2 "" V 3880 3050 50  0001 C CNN
F 3 "~" H 3950 3050 50  0001 C CNN
	1    3950 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 644B27C1
P 3950 2650
F 0 "R3" H 4020 2696 50  0000 L CNN
F 1 "2.2K" H 4020 2605 50  0000 L CNN
F 2 "" V 3880 2650 50  0001 C CNN
F 3 "~" H 3950 2650 50  0001 C CNN
	1    3950 2650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 644C9230
P 3950 4400
F 0 "#PWR?" H 3950 4150 50  0001 C CNN
F 1 "GND" H 3955 4227 50  0000 C CNN
F 2 "" H 3950 4400 50  0001 C CNN
F 3 "" H 3950 4400 50  0001 C CNN
	1    3950 4400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 644CA5DF
P 3950 3300
F 0 "#PWR?" H 3950 3050 50  0001 C CNN
F 1 "GND" H 3955 3127 50  0000 C CNN
F 2 "" H 3950 3300 50  0001 C CNN
F 3 "" H 3950 3300 50  0001 C CNN
	1    3950 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 4300 3950 4400
Wire Wire Line
	3950 3200 3950 3300
Wire Wire Line
	3350 3600 3950 3600
Wire Wire Line
	3350 2500 3950 2500
$Comp
L FPGA_Lattice:ICE40HX1K-TQ144 U1
U 1 1 644F902D
P 5350 3550
F 0 "U1" H 5730 3678 50  0000 L CNN
F 1 "ICE40HX1K-TQ144" H 5730 3587 50  0000 L CNN
F 2 "Package_QFP:TQFP-144_20x20mm_P0.5mm" H 5350 2100 50  0001 C CNN
F 3 "http://www.latticesemi.com/Products/FPGAandCPLD/iCE40" H 4500 4950 50  0001 C CNN
	1    5350 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 2800 3950 2850
Wire Wire Line
	3950 3900 3950 3950
Wire Wire Line
	3950 2850 4450 2850
Wire Wire Line
	4450 2850 4450 2950
Wire Wire Line
	4450 2950 4850 2950
Connection ~ 3950 2850
Wire Wire Line
	3950 2850 3950 2900
Wire Wire Line
	3950 3950 4450 3950
Wire Wire Line
	4450 3950 4450 3050
Wire Wire Line
	4450 3050 4850 3050
Connection ~ 3950 3950
Wire Wire Line
	3950 3950 3950 4000
$Comp
L Connector_Generic:Conn_01x01 J1
U 1 1 6456BFC2
P 3150 2500
F 0 "J1" H 3068 2717 50  0000 C CNN
F 1 "H-Sync" H 3068 2626 50  0000 C CNN
F 2 "" H 3150 2500 50  0001 C CNN
F 3 "~" H 3150 2500 50  0001 C CNN
	1    3150 2500
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J2
U 1 1 6456F249
P 3150 3600
F 0 "J2" H 3068 3817 50  0000 C CNN
F 1 "V-Sync" H 3068 3726 50  0000 C CNN
F 2 "" H 3150 3600 50  0001 C CNN
F 3 "~" H 3150 3600 50  0001 C CNN
	1    3150 3600
	-1   0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 6458663C
P 5350 1950
F 0 "#PWR?" H 5350 1800 50  0001 C CNN
F 1 "+3.3V" H 5365 2123 50  0000 C CNN
F 2 "" H 5350 1950 50  0001 C CNN
F 3 "" H 5350 1950 50  0001 C CNN
	1    5350 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 1950 5350 2050
$Comp
L Transistor_BJT:2N3904 Q1
U 1 1 6458DAF3
P 7050 3200
F 0 "Q1" H 7240 3246 50  0000 L CNN
F 1 "2N3904" H 7240 3155 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 7250 3125 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 7050 3200 50  0001 L CNN
	1    7050 3200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 64593239
P 6600 3200
F 0 "R6" V 6393 3200 50  0000 C CNN
F 1 "820" V 6484 3200 50  0000 C CNN
F 2 "" V 6530 3200 50  0001 C CNN
F 3 "~" H 6600 3200 50  0001 C CNN
	1    6600 3200
	0    1    1    0   
$EndComp
$Comp
L Device:R R5
U 1 1 645938B3
P 6800 2700
F 0 "R5" H 6870 2746 50  0000 L CNN
F 1 "2.2K" H 6870 2655 50  0000 L CNN
F 2 "" V 6730 2700 50  0001 C CNN
F 3 "~" H 6800 2700 50  0001 C CNN
	1    6800 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 6459419F
P 7150 3650
F 0 "R7" H 7220 3696 50  0000 L CNN
F 1 "180" H 7220 3605 50  0000 L CNN
F 2 "" V 7080 3650 50  0001 C CNN
F 3 "~" H 7150 3650 50  0001 C CNN
	1    7150 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R8
U 1 1 64594ABC
P 7150 4050
F 0 "R8" H 7220 4096 50  0000 L CNN
F 1 "1K" H 7220 4005 50  0000 L CNN
F 2 "" V 7080 4050 50  0001 C CNN
F 3 "~" H 7150 4050 50  0001 C CNN
	1    7150 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 2050 7000 2050
Connection ~ 5350 2050
Wire Wire Line
	5350 2050 5350 2150
Wire Wire Line
	6800 2850 6800 3200
Wire Wire Line
	6800 3200 6850 3200
Wire Wire Line
	6750 3200 6800 3200
Connection ~ 6800 3200
Wire Wire Line
	7150 3400 7150 3500
Wire Wire Line
	7150 3800 7150 3850
Wire Wire Line
	4850 3750 4650 3750
Wire Wire Line
	4650 3750 4650 4900
Wire Wire Line
	4650 4900 6450 4900
Wire Wire Line
	6450 4900 6450 3200
$Comp
L power:GND #PWR?
U 1 1 645B9073
P 7150 4350
F 0 "#PWR?" H 7150 4100 50  0001 C CNN
F 1 "GND" H 7155 4177 50  0000 C CNN
F 2 "" H 7150 4350 50  0001 C CNN
F 3 "" H 7150 4350 50  0001 C CNN
	1    7150 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 4200 7150 4350
$Comp
L Connector_Generic:Conn_01x01 J3
U 1 1 645BC1BB
P 8100 3150
F 0 "J3" H 8180 3192 50  0000 L CNN
F 1 "C-Sync" H 8180 3101 50  0000 L CNN
F 2 "" H 8100 3150 50  0001 C CNN
F 3 "~" H 8100 3150 50  0001 C CNN
	1    8100 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 3850 7700 3850
Wire Wire Line
	7700 3850 7700 3150
Wire Wire Line
	7700 3150 7900 3150
Connection ~ 7150 3850
Wire Wire Line
	7150 3850 7150 3900
Wire Wire Line
	7000 2050 7000 2350
Wire Wire Line
	7000 2350 6800 2350
Wire Wire Line
	6800 2350 6800 2550
Wire Wire Line
	7000 2350 7150 2350
Wire Wire Line
	7150 2350 7150 3000
Connection ~ 7000 2350
$Comp
L power:+3.3V #PWR?
U 1 1 644C1058
P 7200 5400
F 0 "#PWR?" H 7200 5250 50  0001 C CNN
F 1 "+3.3V" H 7215 5573 50  0000 C CNN
F 2 "" H 7200 5400 50  0001 C CNN
F 3 "" H 7200 5400 50  0001 C CNN
	1    7200 5400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R9
U 1 1 644C7F3D
P 7650 5550
F 0 "R9" V 7443 5550 50  0000 C CNN
F 1 "150" V 7534 5550 50  0000 C CNN
F 2 "" V 7580 5550 50  0001 C CNN
F 3 "~" H 7650 5550 50  0001 C CNN
	1    7650 5550
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J4
U 1 1 644D7673
P 8250 5550
F 0 "J4" H 8330 5592 50  0000 L CNN
F 1 "RGB_select" H 8330 5501 50  0000 L CNN
F 2 "" H 8250 5550 50  0001 C CNN
F 3 "~" H 8250 5550 50  0001 C CNN
	1    8250 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 5400 7200 5550
Wire Wire Line
	7200 5550 7500 5550
Wire Wire Line
	7800 5550 8050 5550
$EndSCHEMATC