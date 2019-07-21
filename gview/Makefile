APP      = gview
STACK    = 4480k
MALLOC   = 0k

TOOLPATH = ../z_tools/
INCPATH  = ../z_tools/haribote/
APILIBPATH   = ../apilib/
HARIBOTEPATH = ../haribote/

MAKE     = make -r
NASK     = $(TOOLPATH)nask
CC1      = $(TOOLPATH)gocc1 -I$(INCPATH) -I../ -Os -Wall -quiet
GAS2NASK = $(TOOLPATH)gas2nask -a
OBJ2BIM  = $(TOOLPATH)obj2bim
MAKEFONT = $(TOOLPATH)makefont
BIN2OBJ  = $(TOOLPATH)bin2obj
BIM2HRB  = $(TOOLPATH)bim2hrb
BIM2BIN  = $(TOOLPATH)bim2bin
RULEFILE = ../haribote.rul
EDIMG    = $(TOOLPATH)edimg
IMGTOL   = $(TOOLPATH)imgtol.com
GOLIB    = $(TOOLPATH)golib00

# デフォルト動作

default :
	$(MAKE) $(APP).hrb

# ファイル生成規則

$(APP).bim : $(APP).obj bmp.obj jpeg.obj $(APILIBPATH)apilib.lib Makefile
	$(OBJ2BIM) @$(RULEFILE) out:$(APP).bim map:$(APP).map stack:$(STACK) \
		$(APP).obj jpeg.obj bmp.obj $(APILIBPATH)apilib.lib

haribote.img : ../haribote/ipl09.bin ../haribote/haribote.sys $(APP).hrb \
		Makefile
	mformat -f 1440 -C -B ../haribote/ipl09.bin -i haribote.img ::
	mcopy ../haribote/haribote.sys -i haribote.img ::
	mcopy $(APP).hrb -i haribote.img ::
	mcopy ../nihongo/nihongo.fnt -i haribote.img ::

# 一般規則

%.gas : %.c ../apilib.h Makefile
	$(CC1) -o $*.gas $*.c

%.nas : %.gas Makefile
	$(GAS2NASK) $*.gas $*.nas

%.obj : %.nas Makefile
	$(NASK) $*.nas $*.obj $*.lst

%.org : %.bim Makefile
	$(BIM2HRB) $*.bim $*.org $(MALLOC)

%.hrb : %.org Makefile
	$(BIM2BIN) -osacmp in:$*.org out:$*.hrb

# コマンド

run :
	$(MAKE) haribote.img
	sudo qemu-system-i386 -m 32 -localtime -vga std -fda haribote.img -enable-kvm

full :
	$(MAKE) -C $(APILIBPATH)
	$(MAKE) $(APP).hrb

run_full :
	$(MAKE) -C $(APILIBPATH)
	$(MAKE) -C ../haribote
	$(MAKE) run

clean :
	rm -f *.lst
	rm -f gview.obj
	rm -f jpeg.obj
	rm -f *.map
	rm -f *.bim
	rm -f *.org
	rm -f haribote.img

src_only :
	$(MAKE) clean
	rm -f $(APP).hrb
