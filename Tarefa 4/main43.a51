ORG 0000h

reset:
	SETB P1.4 	; Apaga o LED 1
	SETB P3.6 	; Apaga o LED 2
	SETB P3.7 	; Apaga o LED 3
	MOV R0, #20h
	MOV A, #0 	; Zera o acumulador
	
	INC A		; Adiciona o acumulador
	
	MOV 20h, A
	;JB 20.0h, reset

END