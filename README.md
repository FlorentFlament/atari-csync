# An RGB composite sync signal generator for the Atari ST

This repository contains some verilog code to be synthesized and
programmed into a Lattice ICE40HX1K FPGA.  The main target is
`csync-predictive-prog`; it programs the FPGA, to generate a clean RGB
composite sync signal from an Atari ST H-Sync and V-Sync signal. This
allows displaying the Atari ST video outout on any RGB compliant
display device.

Usage:

```
$ make csync-predictive-prod
```

Some other targets are also available (see Makefile), they have mostly
been used to perform some experiments.

More context about this project can be found on my [Generating a clean
Atari ST RGB C-Sync signal][1] article.


## Prerequisites

The following Ubuntu / Debian packages are used:

* yosys
* arachne-pnr
* fpga-icestorm
* iverilog (optional)
* gtkwave (optional)


## Lattice iCEstick pinout

J2 connector ports:

```
J2 pin | signal  | FPGA pin
-------+---------+---------
1      | PIO1_02 | 78
2      | PIO1_03 | 79
3      | PIO1_04 | 80
4      | PIO1_05 | 81
5      | GND     |
6      | +3.3V   |
7      | PIO1_06 | 87
8      | PIO1_07 | 88
9      | PIO1_08 | 90
10     | PIO1_09 | 91
11     | GND     |
12     | +3.3V   |
```

Bottom of iCE40 FPGA stick:
```
 +-------------+
 |7. . . . . .12
 |1. . . . . .6|
 +-------------+
pin 1

     +-----+
      irda
```


[1]:http://www.florentflament.com/blog/generating-a-clean-atari-st-rgb-c-sync-signal.html
