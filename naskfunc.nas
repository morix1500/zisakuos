; naskfunc
; TAB=4

[FORMAT "WCOFF"] ; オブジェクトファイルを作るモード
[INSTRSET "i486p"] ; 486の命令を使いたいという記述
[BITS 32]        ; 32bitモード用の機械語を作らせる

; オブジェクトファイルのための情報

[FILE "naskfunc.nas"]    ; ソースファイル名情報
	GLOBAL _io_hlt; このプログラムに含まれる関数名
	GLOBAL _io_cli, _io_sti, io_stihlt
	GLOBAL _io_in8, _io_in16, _io_in32
	GLOBAL _io_out8, _io_out16, _io_out32
	GLOBAL _io_load_eflags, _io_store_eflags
	GLOBAL _load_gdtr, _load_idtr

; 以下は実際の関数

[SECTION .text]    ; オブジェクトファイルではこれを書いてからプログラムを書く

_io_hlt:   ; void io_hlt(void);
	HLT
	RET

_io_cli:   ; void io_cli(void);
	CLI
	RET

_io_sti:   ; void io_sti(void);
	STI
	RET

_io_stihlt:  ; void io_stihlt(void);
	STI
	HLT
	RET

_io_in8:   ; void io_in8(int port);
	MOV EDX,[ESP+4] ; port
	MOV EAX,0
	IN  AL,DX
	RET

_io_in16:   ; void io_in16(int port);
	MOV EDX,[ESP+4] ; port
	MOV EAX,0
	IN  AX,DX
	RET

_io_in32:   ; void io_in32(int port);
	MOV EDX,[ESP+4] ; port
	IN  EAX,DX
	RET

_io_out8:   ; void io_out8(int port, int data);
	MOV EDX,[ESP+4] ; port
	MOV AL, [ESP+8] ; data
	OUT DX,AL
	RET

_io_out16:   ; void io_out16(int port, int data);
	MOV EDX,[ESP+4] ; port
	MOV AX, [ESP+8] ; data
	OUT DX,AX
	RET

_io_out32:   ; void io_out32(int port, int data);
	MOV EDX,[ESP+4] ; port
	MOV EAX, [ESP+8] ; data
	OUT DX,EAX
	RET

_io_load_eflags: ; int io_load_flags(void);
	PUSHFD   ; PUSH EFLAGSという意味
	POP EAX
	RET  ; CではRETしたときにEAXに入っていた値が返却値だとみなされる

_io_store_eflags: ; void io_store_eflags(int eflags);
	MOV EAX,[ESP+4]
	PUSH EAX
	POPFD    ; POP EFLAGSという意味
	RET

_load_gdtr:  ; void load_gdtr(int limit, int addr);
	MOV  AX,[ESP+4] ; limit
	MOV  [ESP+6],AX
	LGDT [ESP+6]
	RET

_load_idtr:  ; void load_idtr(int limit, int addr);
	MOV  AX,[ESP+4] ; limit
	MOV  [ESP+6],AX
	LIDT [ESP+6]
	RET
