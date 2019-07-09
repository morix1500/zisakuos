[BITS 32]
	MOV	AL,'A'
	CALL	0xbe5
fin:
	HTL
	JMP fin
