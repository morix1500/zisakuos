ipl.bin : ipl.nas Makefile
	z_tools/nask.exe ipl.nas ipl.bin ipl.lst

helloos.img : ipl.bin Makefile
	cat ipl.bin > helloos.img

img :
	make -r helloos.img

asm :
	make -r ipl.bin

run :
	make img
	qemu-system-i386 helloos.img
runFp :
	make img
	qemu-system-i386 -fda helloos.img

clean :
	rm -f ipl.bin
	rm -f ipl.lst

src-only :
	make clean
	rm -f helloos.img

clean-all:
	make clean
	make src-only
