#!/bin/bash
#echo "Starting reading..."
c=$(cat .counter)
if [ -z "$c" ]; then 
	let c=1
else
	let c=$c+1
fi
echo "try $c..."
./../minipro/minipro/minipro -i -p "MX25L6445E @SOP8" -r read_$c.bin
echo $c > .counter
echo "done."
