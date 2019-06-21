// {}がなくていきなり;を書くと、他のファイルにある という意味になる
void io_hlt(void);

void HariMain(void) {
	int i;
	char *p; // メモリ専用番地と宣言。charは1バイトだがメモリ番地を指定するので4バイト保持する

	for (i = 0xa0000; i <= 0xaffff; i++) {
		p = (char *) i; // 番地を代入。 MOV ECX, i
		*p = i & 0x0f;  // MOV BYTE [ECX], (i & 0x0f) がやりたい
	}
	for (;;) {
		io_hlt();
	}
}
