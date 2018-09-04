; Exemplo.s
; Desenvolvido para a placa EK-TM4C1294XL
; Prof. Guilherme Peron
; 12/03/2018

; -------------------------------------------------------------------------------
        THUMB                        ; Instru��es do tipo Thumb-2
; -------------------------------------------------------------------------------
; Declara��es EQU - Defines
;<NOME>         EQU <VALOR>
; -------------------------------------------------------------------------------
; �rea de Dados - Declara��es de vari�veis
		AREA  DATA, ALIGN=2
		; Se alguma vari�vel for chamada em outro arquivo
		;EXPORT  <var> [DATA,SIZE=<tam>]   ; Permite chamar a vari�vel <var> a 
		                                   ; partir de outro arquivo
;<var>	SPACE <tam>                        ; Declara uma vari�vel de nome <var>
                                           ; de <tam> bytes a partir da primeira 
                                           ; posi��o da RAM		
vetor	SPACE 10
; -------------------------------------------------------------------------------
; �rea de C�digo - Tudo abaixo da diretiva a seguir ser� armazenado na mem�ria de 
;                  c�digo
        AREA    |.text|, CODE, READONLY, ALIGN=2

		; Se alguma fun��o do arquivo for chamada em outro arquivo	
        EXPORT Start                ; Permite chamar a fun��o Start a partir de 
			                        ; outro arquivo. No caso startup.s
									
		; Se chamar alguma fun��o externa	
        ;IMPORT <func>              ; Permite chamar dentro deste arquivo uma 
									; fun��o <func>

; -------------------------------------------------------------------------------
; Fun��o main()
Start  
; Comece o c�digo aqui <======================================================
		MOV 	R0, #0			;int i = 0
for1	LDR 	R2, =vetor		;int *vetor = <memory position>
		ADD		R2, R2, R0
		ADD		R3, R2, #1
		LDRSB 	R4, [R2]		;int v0 = vetor[R2]
		LDRSB	R5, [R3]
		CMP		R4, R5
		BGT		replace
return		
		ADD		R0, #1
		CMP		R0, #9
		BNE		for1
		MOV		R0, #0
		CMP		R1, #1
		ITT EQ	
		MOVEQ	R1, #0
		BEQ		for1
		NOP

replace	STRB	R4, [R3]
		STRB	R5, [R2]
		MOV		R1, #1
		B 		return
		
		
    ALIGN                           ; garante que o fim da se��o est� alinhada 
    END                             ; fim do arquivo