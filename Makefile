TOOLPATH = z_tools/
INCPATH  = z_tools/haribote/

MAKE = make -r

# デフォルト動作
default :
	$(MAKE) haribote.img

haribote.img : haribote/ipl20.bin haribote/haribote.sys Makefile \
	a/a.hrb hello3/hello3.hrb hello4/hello4.hrb \
	winhelo/winhelo.hrb winhelo2/winhelo2.hrb winhelo3/winhelo3.hrb \
	star1/star1.hrb stars/stars.hrb stars2/stars2.hrb \
	lines/lines.hrb walk/walk.hrb noodle/noodle.hrb \
	beepdown/beepdown.hrb color/color.hrb color2/color2.hrb \
	sosu/sosu.hrb sosu2/sosu2.hrb sosu3/sosu3.hrb \
	typeipl/typeipl.hrb cat/cat.hrb iroha/iroha.hrb \
	chklang/chklang.hrb notrec/notrec.hrb bball/bball.hrb \
	invader/invader.hrb calc/calc.hrb
	mformat -f 1440 -C -B haribote/ipl20.bin -i haribote.img ::
	mcopy haribote/haribote.sys -i haribote.img ::
	mcopy haribote/ipl10.nas -i haribote.img ::
	mcopy haribote/ipl20.nas -i haribote.img ::
	mcopy a/a.hrb -i haribote.img ::
	mcopy hello3/hello3.hrb -i haribote.img ::
	mcopy hello4/hello4.hrb -i haribote.img ::
	mcopy winhelo/winhelo.hrb -i haribote.img ::
	mcopy winhelo2/winhelo2.hrb -i haribote.img ::
	mcopy winhelo3/winhelo3.hrb -i haribote.img ::
	mcopy star1/star1.hrb -i haribote.img ::
	mcopy stars/stars.hrb -i haribote.img ::
	mcopy stars2/stars2.hrb -i haribote.img ::
	mcopy lines/lines.hrb -i haribote.img ::
	mcopy walk/walk.hrb -i haribote.img ::
	mcopy noodle/noodle.hrb -i haribote.img ::
	mcopy beepdown/beepdown.hrb -i haribote.img ::
	mcopy color/color.hrb -i haribote.img ::
	mcopy color2/color2.hrb -i haribote.img ::
	mcopy sosu/sosu.hrb -i haribote.img ::
	mcopy sosu2/sosu2.hrb -i haribote.img ::
	mcopy sosu3/sosu3.hrb -i haribote.img ::
	mcopy typeipl/typeipl.hrb -i haribote.img ::
	mcopy cat/cat.hrb -i haribote.img ::
	mcopy iroha/iroha.hrb -i haribote.img ::
	mcopy chklang/chklang.hrb -i haribote.img ::
	mcopy notrec/notrec.hrb -i haribote.img ::
	mcopy bball/bball.hrb -i haribote.img ::
	mcopy invader/invader.hrb -i haribote.img ::
	mcopy calc/calc.hrb -i haribote.img ::
	mcopy nihongo/nihongo.fnt -i haribote.img ::
	mcopy test.txt -i haribote.img ::

run :
	make haribote.img
	sudo qemu-system-i386 -m 32 -localtime -vga std -fda haribote.img -enable-kvm

full :
	make -C haribote
	make -C apilib
	make -C a
	make -C hello3
	make -C hello4
	make -C winhelo
	make -C winhelo2
	make -C winhelo3
	make -C star1
	make -C stars
	make -C stars2
	make -C lines
	make -C walk
	make -C noodle
	make -C beepdown
	make -C color
	make -C color2
	make -C sosu
	make -C sosu2
	make -C sosu3
	make -C typeipl
	make -C cat
	make -C iroha
	make -C chklang
	make -C notrec
	make -C bball
	make -C invader
	make -C calc
	make haribote.img

run_full :
	make full
	sudo qemu-system-i386 -m 32 -localtime -vga std -fda haribote.img -enable-kvm
	
run_os :
	make -C haribote
	make run
clean :

src-only :
	make clean
	rm -f haribote.img

clean_full :
	$(MAKE) -C haribote		clean
	$(MAKE) -C apilib		clean
	$(MAKE) -C a			clean
	$(MAKE) -C hello3		clean
	$(MAKE) -C hello4		clean
	$(MAKE) -C winhelo		clean
	$(MAKE) -C winhelo2		clean
	$(MAKE) -C winhelo3		clean
	$(MAKE) -C star1		clean
	$(MAKE) -C stars		clean
	$(MAKE) -C stars2		clean
	$(MAKE) -C lines		clean
	$(MAKE) -C walk			clean
	$(MAKE) -C noodle		clean
	$(MAKE) -C beepdown		clean
	$(MAKE) -C color		clean
	$(MAKE) -C color2		clean
	$(MAKE) -C sosu                 clean
	$(MAKE) -C sosu2                clean
	$(MAKE) -C sosu3                clean
	$(MAKE) -C typeipl              clean
	$(MAKE) -C cat                  clean
	$(MAKE) -C iroha                clean
	$(MAKE) -C chklang              clean
	$(MAKE) -C notrec               clean
	$(MAKE) -C bball                clean
	$(MAKE) -C invader              clean
	$(MAKE) -C calc                 clean
	rm -f haribote.img

src_only_full :
	$(MAKE) -C haribote		src_only
	$(MAKE) -C apilib		src_only
	$(MAKE) -C a			src_only
	$(MAKE) -C hello3		src_only
	$(MAKE) -C hello4		src_only
	$(MAKE) -C winhelo		src_only
	$(MAKE) -C winhelo2		src_only
	$(MAKE) -C winhelo3		src_only
	$(MAKE) -C star1		src_only
	$(MAKE) -C stars		src_only
	$(MAKE) -C stars2		src_only
	$(MAKE) -C lines		src_only
	$(MAKE) -C walk			src_only
	$(MAKE) -C noodle		src_only
	$(MAKE) -C beepdown		src_only
	$(MAKE) -C color		src_only
	$(MAKE) -C color2		src_only
	$(MAKE) -C sosu                 src_only
	$(MAKE) -C sosu2                src_only
	$(MAKE) -C sosu3                src_only
	$(MAKE) -C typeipl              src_only
	$(MAKE) -C cat                  src_only
	$(MAKE) -C iroha                src_only
	$(MAKE) -C chklang              src_only
	$(MAKE) -C notrec               src_only
	$(MAKE) -C bball                src_only
	$(MAKE) -C invader              src_only
	$(MAKE) -C calc                 src_only
	-$(DEL) haribote.img

refresh :
	$(MAKE) full
	$(MAKE) clean_full
	rm -f haribote.img
