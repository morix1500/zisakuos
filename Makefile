OBJS_BOOTPACK = bootpack.obj naskfunc.obj hankaku.obj graphic.obj dsctbl.obj \
		int.obj fifo.obj keyboard.obj mouse.obj memory.obj sheet.obj \
		timer.obj mtask.obj window.obj console.obj file.obj

TOOLPATH = z_tools/
INCPATH  = z_tools/haribote/

NASK = $(TOOLPATH)nask.exe
CC1  = $(TOOLPATH)cc1.exe -I$(INCPATH) -Os -Wall -quiet
GAS2NASK = $(TOOLPATH)gas2nask.exe -a
RULEFILE = $(TOOLPATH)haribote/haribote.rul
OBJ2BIM  = $(TOOLPATH)obj2bim.exe
BIM2HRB  = $(TOOLPATH)bim2hrb.exe
BIN2OBJ  = $(TOOLPATH)bin2obj.exe
MAKEFONT = $(TOOLPATH)makefont.exe

# デフォルト動作
default :
	$(MAKE) img

# ファイル生成規則
ipl10.bin : ipl10.nas Makefile
	$(NASK) ipl10.nas ipl10.bin ipl10.lst

asmhead.bin : asmhead.nas Makefile
	$(NASK) asmhead.nas asmhead.bin asmhead.lst

hankaku.bin : hankaku.txt Makefile
	$(MAKEFONT) hankaku.txt hankaku.bin

hankaku.obj : hankaku.bin Makefile
	$(BIN2OBJ) hankaku.bin hankaku.obj _hankaku

bootpack.bim : $(OBJS_BOOTPACK) Makefile
	$(OBJ2BIM) @$(RULEFILE) out:bootpack.bim stack:3136k map:bootpack.map \
		$(OBJS_BOOTPACK)
	# 3Mb + 64Kb = 3136Kb

bootpack.hrb : bootpack.bim Makefile
	$(BIM2HRB) bootpack.bim bootpack.hrb 0

hello.hrb : hello.nas Makefile
	$(NASK) hello.nas hello.hrb hello.lst

hello2.hrb : hello2.nas Makefile
	$(NASK) hello2.nas hello2.hrb hello2.lst

a.bim : a.obj a_nask.obj Makefile
	$(OBJ2BIM) @$(RULEFILE) out:a.bim map:a.map a.obj a_nask.obj

a.hrb : a.bim Makefile
	$(BIM2HRB) a.bim a.hrb 0

hello3.bim : hello3.obj a_nask.obj Makefile
	$(OBJ2BIM) @$(RULEFILE) out:hello3.bim map:hello3.map hello3.obj a_nask.obj

hello3.hrb : hello3.bim Makefile
	$(BIM2HRB) hello3.bim hello3.hrb 0

hello4.bim : hello4.obj a_nask.obj Makefile
	$(OBJ2BIM) @$(RULEFILE) out:hello4.bim stack:1k map:hello4.map hello4.obj a_nask.obj

hello4.hrb : hello4.bim Makefile
	$(BIM2HRB) hello4.bim hello4.hrb 0

winhelo.bim : winhelo.obj a_nask.obj Makefile
	$(OBJ2BIM) @$(RULEFILE) out:winhelo.bim stack:1k map:winhelo.map winhelo.obj a_nask.obj

winhelo.hrb : winhelo.bim Makefile
	$(BIM2HRB) winhelo.bim winhelo.hrb 0

winhelo2.bim : winhelo2.obj a_nask.obj Makefile
	$(OBJ2BIM) @$(RULEFILE) out:winhelo2.bim stack:1k map:winhelo2.map winhelo2.obj a_nask.obj

winhelo2.hrb : winhelo2.bim Makefile
	$(BIM2HRB) winhelo2.bim winhelo2.hrb 0

winhelo3.bim : winhelo3.obj a_nask.obj Makefile
	$(OBJ2BIM) @$(RULEFILE) out:winhelo3.bim stack:1k map:winhelo3.map winhelo3.obj a_nask.obj

winhelo3.hrb : winhelo3.bim Makefile
	$(BIM2HRB) winhelo3.bim winhelo3.hrb 40k

star1.bim : star1.obj a_nask.obj Makefile
	$(OBJ2BIM) @$(RULEFILE) out:star1.bim stack:1k map:star1.map star1.obj a_nask.obj

star1.hrb : star1.bim Makefile
	$(BIM2HRB) star1.bim star1.hrb 47k

stars.bim : stars.obj a_nask.obj Makefile
	$(OBJ2BIM) @$(RULEFILE) out:stars.bim stack:1k map:stars.map stars.obj a_nask.obj
	
stars.hrb : stars.bim Makefile
	$(BIM2HRB) stars.bim stars.hrb 47k
	
stars2.bim : stars2.obj a_nask.obj Makefile
	$(OBJ2BIM) @$(RULEFILE) out:stars2.bim stack:1k map:stars2.map stars2.obj a_nask.obj
	
stars2.hrb : stars2.bim Makefile
	$(BIM2HRB) stars2.bim stars2.hrb 47k
	
haribote.sys : asmhead.bin bootpack.hrb Makefile
	cat asmhead.bin bootpack.hrb > haribote.sys

haribote.img : ipl10.bin haribote.sys hello.hrb hello2.hrb a.hrb hello3.hrb hello4.hrb winhelo.hrb winhelo2.hrb winhelo3.hrb star1.hrb stars.hrb stars2.hrb Makefile
	mformat -f 1440 -C -B ipl10.bin -i haribote.img ::
	mcopy haribote.sys -i haribote.img ::
	mcopy ipl10.nas -i haribote.img ::
	mcopy Makefile -i haribote.img ::
	mcopy hello.hrb -i haribote.img ::
	mcopy hello2.hrb -i haribote.img ::
	mcopy a.hrb -i haribote.img ::
	mcopy hello3.hrb -i haribote.img ::
	mcopy hello4.hrb -i haribote.img ::
	mcopy winhelo.hrb -i haribote.img ::
	mcopy winhelo2.hrb -i haribote.img ::
	mcopy winhelo3.hrb -i haribote.img ::
	mcopy star1.hrb -i haribote.img ::
	mcopy stars.hrb -i haribote.img ::
	mcopy stars2.hrb -i haribote.img ::

# 一般規則
%.gas : %.c Makefile
	$(CC1) -o $*.gas $*.c

%.nas : %.gas Makefile
	$(GAS2NASK) $*.gas $*.nas

%.obj : %.nas Makefile
	$(NASK) $*.nas $*.obj $*.lst

img :
	make -r haribote.img

asm :
	make -r ipl10.bin

run :
	make clean-all
	make img
	sudo qemu-system-i386 -m 32 -localtime -vga std -fda haribote.img -enable-kvm

clean :
	rm -f *.bin
	rm -f *.lst
	rm -f *.gas
	rm -f *.obj
	rm -f *.bim
	rm -f *.map
	rm -f *.hrb
	rm -f bootpack.nas
	rm -f graphic.nas
	rm -f dsctbl.nas
	rm -f haribote.sys
	rm -f hlt.hrb
	rm -f hello.hrb
	rm -f hello2.hrb

src-only :
	make clean
	rm -f haribote.img

clean-all:
	make clean
	make src-only
