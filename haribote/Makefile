OBJS_BOOTPACK = bootpack.obj naskfunc.obj hankaku.obj graphic.obj dsctbl.obj \
		int.obj fifo.obj keyboard.obj mouse.obj memory.obj sheet.obj \
		timer.obj mtask.obj window.obj console.obj file.obj

TOOLPATH = ../z_tools/
INCPATH  = ../z_tools/haribote/

MAKE = make -r
NASK = $(TOOLPATH)nask
CC1  = $(TOOLPATH)gocc1 -I$(INCPATH) -Os -Wall -quiet
GAS2NASK = $(TOOLPATH)gas2nask -a
RULEFILE = $(TOOLPATH)haribote/haribote.rul
OBJ2BIM  = $(TOOLPATH)obj2bim
BIM2HRB  = $(TOOLPATH)bim2hrb
BIN2OBJ  = $(TOOLPATH)bin2obj
MAKEFONT = $(TOOLPATH)makefont
GOLIB    = $(TOOLPATH)golib00

# デフォルト動作
default :
	$(MAKE) ipl20.bin
	$(MAKE) haribote.sys

# ファイル生成規則
ipl20.bin : ipl20.nas Makefile
	$(NASK) ipl20.nas ipl20.bin ipl20.lst

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

haribote.sys : asmhead.bin bootpack.hrb Makefile
	cat asmhead.bin bootpack.hrb > haribote.sys

# 一般規則
%.gas : %.c bootpack.h Makefile
	$(CC1) -o $*.gas $*.c

%.nas : %.gas Makefile
	$(GAS2NASK) $*.gas $*.nas

%.obj : %.nas Makefile
	$(NASK) $*.nas $*.obj $*.lst

clean :
	rm -f asmhead.bin
	rm -f hankaku.bin
	rm -f *.lst
	rm -f *.gas
	rm -f *.obj
	rm -f *.bim
	rm -f *.map
	rm -f *.hrb
	rm -f bootpack.nas
	rm -f graphic.nas
	rm -f dsctbl.nas
	#rm -f haribote.sys
	rm -f hlt.hrb

src-only :
	make clean
