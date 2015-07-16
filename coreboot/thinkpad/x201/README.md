
report installing Coreboot on Thinkpad x201
===========================================

#All Success

Working and tested
==================
* CPU i5 4 core, VT-x, AES - ok
* 4+4GB RAM
* USB
* VGA-DSUB
* 3G Modem GOBI3000
* Ethernet 1000Mbit
* WIFI
* ACPI
* Volume/Light hotkeys
* trackpad
* Dokstation
  * CD/DVD-R
  * USB
  * DP/HDMI out

Not tested
==========
* dialup modem
* PCMCIA express port 


Not working
===========
* not found

BUGS
====
* Screen turns black in 10 min regardless of screensaver configs [CONFIRMED BUG](https://labs.riseup.net/code/issues/5617) FIXED (it's screensaver issue NOT coreboot)
* USB port contunue working with power after turn off 
* memtest86+ will found some BAD area in GOOD RAM. [CONFIRMED](http://www.coreboot.org/pipermail/coreboot/2015-February/079210.html) Can be fixed by recompiling memtest86 with Coreboot memory map.

Wanted
======
* There are no CPU termperature hardware shutdown limits present.


