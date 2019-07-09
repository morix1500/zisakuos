[BITS 32]
	MOV	AL,'A'
	CALL	2*8:0xbe5
fin:
	HTL
	JMP fin
