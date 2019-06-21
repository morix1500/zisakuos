// {}がなくていきなり;を書くと、他のファイルにある という意味になる
void io_hlt(void);

void HariMain(void) {
	int i;
	char *p; // メモリ専用番地と宣言。charは1バイトだがメモリ番地を指定するので4バイト保持する
	p = (char *) 0xa0000;

	for (i = 0; i <= 0xaffff; i++) {
		*(p + i) = i & 0x0f;  // MOV BYTE [ECX], (i & 0x0f) がやりたい
	}
	for (;;) {
		io_hlt();
	}
}
