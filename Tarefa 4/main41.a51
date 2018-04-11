ORG 0000h

	CLR P1.4 ; LED 1
	
start:
	CPL P1.4
	
MOV R1, #10	; 1c
delay1:
	MOV R2, #200	; 1c
	delay2:
		MOV R6, #250	; 1c
		delay3:
			DJNZ R6, delay3	; 2c
		DJNZ R2, delay2	; 2c
	DJNZ R1, delay1	; 2c
	
	CPL P1.4
	
MOV R1, #30	; 1c
delay4:
	MOV R2, #200	; 1c
	delay5:
		MOV R6, #250	; 1c
		delay6:
			DJNZ R6, delay6	; 2c
		DJNZ R2, delay5	; 2c
	DJNZ R1, delay4	; 2c
	
	JMP start

END
