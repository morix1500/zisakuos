ipl.bin : ipl.nas Makefile
	z_tools/nask.exe ipl.nas ipl.bin ipl.lst

haribote.sys : haribote.nas Makefile
	z_tools/nask.exe haribote.nas haribote.sys haribote.lst

haribote.img : ipl.bin haribote.sys Makefile
	mformat -f 1440 -C -B ipl.bin -i haribote.img ::
	mcopy haribote.sys -i haribote.img ::

img :
	make -r haribote.img

asm :
	make -r ipl.bin

run :
	make img
	qemu-system-i386 haribote.img
runFp :
	make img
	qemu-system-i386 -fda haribote.img

clean :
	rm -f ipl.bin
	rm -f ipl.lst
	rm -f haribote.sys
	rm -f haribote.lst

src-only :
	make clean
	rm -f haribote.img

clean-all:
	make clean
	make src-only
