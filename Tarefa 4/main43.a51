ORG 0000h

	SETB P1.4 	; Apaga o LED 1
	SETB P3.6 	; Apaga o LED 2
	SETB P3.7 	; Apaga o LED 3
begin:
    MOV R0, #7h 	; Inicializa o acomulador

loop:
	MOV A, #7h
	SUBB A, R0
	MOV B, A
	JB B.0, pos0
	SETB P1.4
	SJMP next0
pos0:
	CLR P1.4
next0:
	JB B.1, pos1
	SETB P3.6
	SJMP next1
pos1:
	CLR P3.6
next1:
	JB B.2, pos2
	SETB P3.7
	SJMP next2
pos2:
	CLR P3.7
next2:
	mov A, R1
	mov A, 30h 
	mov R1, #44h
	mov A, @R1
	mov A, #25
	
linhadecima:
	sjmp pulaum
	nop
pulaum:
	movc A, @A+DPTR
	
	DJNZ R0, loop
	SJMP begin
	;MOVX @R0, A
	;JB 20.0h, reset
	
END