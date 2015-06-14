sudo cat /proc/iomem | grep 'Video ROM' | (read m; m=${m/ :*}; s=${m/-*}; e=${m/*-}; sudo dd if=/dev/mem of=vgabios.bin bs=1c skip=$[0x$s] count=$[$[0x$e]-$[0x$s]+1])
