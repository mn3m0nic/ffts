#!/bin/bash
#
# Description: 
# This dummy script decrease maximum frequency and also max temperature to 95`C
# when cpu loaded on 100% by cpuburn tests.
# Without it temperature can go over 110`C which causes system emeregency shutdown.
# But you need to set YOUR frequency depended from your cooling system health.
# 
#
# Current FAN parameters can be found here:
# $ cat /proc/acpi/ibm/fan
# status:		enabled
# speed:		3704
# level:		auto
# commands:	level <level> (<level> is 0-7, auto, disengaged, full-speed)
# commands:	enable, disable
# commands:	watchdog <timeout> (<timeout> is 0 (off), 1-120 (seconds))
#
# Current sensors values can found here:
# $ acpi -v
# [...]
# or from lm-sensors package
# $ sensors
# [...]
#
# Possible value for CPU core frequency can be found here:
# $ cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
# 2667000 2666000 2533000 2400000 2266000 2133000 2000000 1866000 1733000 1600000 1466000 1333000 1200000
#
# WARNING!
# This script goes without any waranty on "AS IS" terms.
#
# 
FREQ=1866000
for cpu in 0 1 2 3; do
	echo $FREQ | sudo tee /sys/devices/system/cpu/cpu$cpu/cpufreq/scaling_max_freq > /dev/null
done
