dd if=read_31.bin of=descriptor.bin count=12288 bs=1M iflag=count_bytes
dd if=read_31.bin of=me.bin skip=12288 count=5230592 bs=1M iflag=count_bytes,skip_bytes
