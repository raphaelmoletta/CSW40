ORG 0000H
	;estados iniciais dos pinos
	CLR P1.4 ; ACENDE LED3
	CPL P1.4 ; APAGA LED3
	
	;LOOP PARA VERIFICAR O ESTADO DO PINO P3.3
	
	buttonPressed:
	MOV A, #00000100b
	ANL A, P3
	CJNE A, #00000100b,buttonOnHold ; BOTAO SW1
	JMP buttonPressed
	
	buttonOnHold:
	MOV A, #00000100b
	ANL A, P3
	CJNE A, #00000000b, piscaLED ; BOTAO SW1
	JMP buttonOnHold
	
	piscaLED:
	CPL P1.4 
	;Carrega o R0 com um valor para fazer um la?o
	MOV R2, #8d
	
	delay2:
		MOV R1, #250d
	delay1:
		MOV R0, #250d
	delay0:

		DJNZ R0, delay0
		DJNZ R1, delay1
		DJNZ R2, delay2
		
	MOV A, #00000100b
	ANL A, P3
	CJNE A, #00000000b,piscaLED ; BOTAO SW1
		

	
	buttonOnHoldReset:
	MOV A, #00000100b
	ANL A, P3
	CJNE A, #00000100b, buttonOnHoldReset ; BOTAO SW1
	
	CLR P1.4 ; ACENDE LED3
	CPL P1.4 ; APAGA LED3

	JMP buttonPressed
		
END
