#!/bin/bash
#
MINIPRO=./../minipro/minipro/minipro
#MINIPRO=/usr/local/bin/minipr
CHIP="MX25L6445E @SOP8"
ROM=build/coreboot.rom

echo "Write file $ROM to ROM? [yn]"
read a
if [ "$a" != "y" ]; then
exit
fi

$MINIPRO -i -p "$CHIP" -w $ROM
