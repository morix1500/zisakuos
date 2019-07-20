OBJS_API =	api001.obj api002.obj api003.obj api004.obj api005.obj api006.obj \
			api007.obj api008.obj api009.obj api010.obj api011.obj api012.obj \
			api013.obj api014.obj api015.obj api016.obj api017.obj api018.obj \
			api019.obj api020.obj api021.obj api022.obj api023.obj api024.obj \
			api025.obj api026.obj api027.obj \
			alloca.obj

TOOLPATH = ../z_tools/
INCPATH  = ../z_tools/haribote/

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
	$(MAKE) apilib.lib

# ファイル生成規則
apilib.lib : Makefile $(OBJS_API)
	$(GOLIB) $(OBJS_API) out:apilib.lib

# 一般規則
%.obj : %.nas Makefile
	$(NASK) $*.nas $*.obj $*.lst

clean :
	rm -f *.lst
	rm -f *.obj

src-only :
	make clean
