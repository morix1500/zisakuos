OBJS_BOOTPACK = bootpack.obj naskfunc.obj hankaku.obj graphic.obj dsctbl.obj \
		int.obj fifo.obj keyboard.obj mouse.obj memory.obj sheet.obj \
		timer.obj mtask.obj window.obj console.obj file.obj

OBJS_API =	api001.obj api002.obj api003.obj api004.obj api005.obj api006.obj \
			api007.obj api008.obj api009.obj api010.obj api011.obj api012.obj \
			api013.obj api014.obj api015.obj api016.obj api017.obj api018.obj \
			api019.obj api020.obj

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

a.bim : a.obj $(OBJS_API) Makefile
	$(OBJ2BIM) @$(RULEFILE) out:a.bim map:a.map a.obj $(OBJS_API)

a.hrb : a.bim Makefile
	$(BIM2HRB) a.bim a.hrb 0

hello3.bim : hello3.obj $(OBJS_API) Makefile
	$(OBJ2BIM) @$(RULEFILE) out:hello3.bim map:hello3.map hello3.obj $(OBJS_API)

hello3.hrb : hello3.bim Makefile
	$(BIM2HRB) hello3.bim hello3.hrb 0

hello4.bim : hello4.obj $(OBJS_API) Makefile
	$(OBJ2BIM) @$(RULEFILE) out:hello4.bim stack:1k map:hello4.map hello4.obj $(OBJS_API)

hello4.hrb : hello4.bim Makefile
	$(BIM2HRB) hello4.bim hello4.hrb 0

winhelo.bim : winhelo.obj $(OBJS_API) Makefile
	$(OBJ2BIM) @$(RULEFILE) out:winhelo.bim stack:1k map:winhelo.map winhelo.obj $(OBJS_API)

winhelo.hrb : winhelo.bim Makefile
	$(BIM2HRB) winhelo.bim winhelo.hrb 0

winhelo2.bim : winhelo2.obj $(OBJS_API) Makefile
	$(OBJ2BIM) @$(RULEFILE) out:winhelo2.bim stack:1k map:winhelo2.map winhelo2.obj $(OBJS_API)

winhelo2.hrb : winhelo2.bim Makefile
	$(BIM2HRB) winhelo2.bim winhelo2.hrb 0

winhelo3.bim : winhelo3.obj $(OBJS_API) Makefile
	$(OBJ2BIM) @$(RULEFILE) out:winhelo3.bim stack:1k map:winhelo3.map winhelo3.obj $(OBJS_API)

winhelo3.hrb : winhelo3.bim Makefile
	$(BIM2HRB) winhelo3.bim winhelo3.hrb 40k

star1.bim : star1.obj $(OBJS_API) Makefile
	$(OBJ2BIM) @$(RULEFILE) out:star1.bim stack:1k map:star1.map star1.obj $(OBJS_API)

star1.hrb : star1.bim Makefile
	$(BIM2HRB) star1.bim star1.hrb 47k

stars.bim : stars.obj $(OBJS_API) Makefile
	$(OBJ2BIM) @$(RULEFILE) out:stars.bim stack:1k map:stars.map stars.obj  $(OBJS_API)
	
stars.hrb : stars.bim Makefile
	$(BIM2HRB) stars.bim stars.hrb 47k
	
stars2.bim : stars2.obj $(OBJS_API) Makefile
	$(OBJ2BIM) @$(RULEFILE) out:stars2.bim stack:1k map:stars2.map stars2.obj $(OBJS_API)
	
stars2.hrb : stars2.bim Makefile
	$(BIM2HRB) stars2.bim stars2.hrb 47k

lines.bim : lines.obj $(OBJS_API) Makefile
	$(OBJ2BIM) @$(RULEFILE) out:lines.bim stack:1k map:lines.map lines.obj $(OBJS_API)
	
lines.hrb : lines.bim Makefile
	$(BIM2HRB) lines.bim lines.hrb 47k

walk.bim : walk.obj $(OBJS_API) Makefile
	$(OBJ2BIM) @$(RULEFILE) out:walk.bim stack:1k map:walk.map walk.obj $(OBJS_API)
	
walk.hrb : walk.bim Makefile
	$(BIM2HRB) walk.bim walk.hrb 47k

noodle.bim : noodle.obj $(OBJS_API) Makefile
	$(OBJ2BIM) @$(RULEFILE) out:noodle.bim stack:1k map:noodle.map noodle.obj $(OBJS_API)
	
noodle.hrb : noodle.bim Makefile
	$(BIM2HRB) noodle.bim noodle.hrb 47k

beepdown.bim : beepdown.obj $(OBJS_API) Makefile
	$(OBJ2BIM) @$(RULEFILE) out:beepdown.bim stack:1k map:beepdown.map beepdown.obj $(OBJS_API)
	
beepdown.hrb : beepdown.bim Makefile
	$(BIM2HRB) beepdown.bim beepdown.hrb 47k

color.bim : color.obj $(OBJS_API) Makefile
	$(OBJ2BIM) @$(RULEFILE) out:color.bim stack:1k map:color.map color.obj $(OBJS_API)
	
color.hrb : color.bim Makefile
	$(BIM2HRB) color.bim color.hrb 56k

color2.bim : color2.obj $(OBJS_API) Makefile
	$(OBJ2BIM) @$(RULEFILE) out:color2.bim stack:1k map:color2.map color2.obj $(OBJS_API)
	
color2.hrb : color2.bim Makefile
	$(BIM2HRB) color2.bim color2.hrb 56k
	
haribote.sys : asmhead.bin bootpack.hrb Makefile
	cat asmhead.bin bootpack.hrb > haribote.sys

crack7.bim : crack7.obj Makefile
	$(OBJ2BIM) @$(RULEFILE) out:crack7.bim stack:1k map:crack7.map crack7.obj

crack7.hrb : crack7.bim Makefile
	$(BIM2HRB) crack7.bim crack7.hrb 0k

haribote.img : ipl10.bin haribote.sys hello.hrb hello2.hrb a.hrb hello3.hrb hello4.hrb \
	winhelo.hrb winhelo2.hrb winhelo3.hrb star1.hrb stars.hrb stars2.hrb \
	lines.hrb walk.hrb noodle.hrb beepdown.hrb color.hrb color2.hrb \
	crack7.hrb \
	Makefile
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
	mcopy lines.hrb -i haribote.img ::
	mcopy walk.hrb -i haribote.img ::
	mcopy noodle.hrb -i haribote.img ::
	mcopy beepdown.hrb -i haribote.img ::
	mcopy color.hrb -i haribote.img ::
	mcopy color2.hrb -i haribote.img ::
	mcopy crack7.hrb -i haribote.img ::

# 一般規則
%.gas : %.c Makefile
	$(CC1) -o $*.gas $*.c

%.nas : %.gas Makefile
	$(GAS2NASK) $*.gas $*.nas

%.obj : %.nas Makefile
	$(NASK) $*.nas $*.obj $*.lst

app_%.bim : app_%.obj a_nask.obj Makefile
	$(OBJ2BIM) @$(RULEFILE) out:app_$*.bim stack:1k map:app_$*.map app_$*.obj a_nask.obj
	
app_%.hrb : app_%.bim Makefile
	$(BIM2HRB) app_$*.bim app_$*.hrb 47k

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
