// {}がなくていきなり;を書くと、他のファイルにある という意味になる
void io_hlt(void);
void write_mem8(int addr, int data);

void HariMain(void) {
	int i;
	for (i = 0xa0000; i <= 0xaffff; i++) {
		write_mem8(i, 14);
	}
	for (;;) {
		io_hlt();
	}
}
