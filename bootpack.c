// {}がなくていきなり;を書くと、他のファイルにある という意味になる
void io_hlt(void);

void HariMain(void) {
fin:
	io_hlt();
	goto fin;
}
