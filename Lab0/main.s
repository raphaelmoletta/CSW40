; Exemplo.s
; Desenvolvido para a placa EK-TM4C1294XL
; Prof. Guilherme Peron
; 12/03/2018

; -------------------------------------------------------------------------------
        THUMB                        ; Instruções do tipo Thumb-2
; -------------------------------------------------------------------------------
; Declarações EQU - Defines
;<NOME>         EQU <VALOR>
; -------------------------------------------------------------------------------
; Área de Dados - Declarações de variáveis
		AREA  DATA, ALIGN=2
		; Se alguma variável for chamada em outro arquivo
		;EXPORT  <var> [DATA,SIZE=<tam>]   ; Permite chamar a variável <var> a 
		                                   ; partir de outro arquivo
;<var>	SPACE <tam>                        ; Declara uma variável de nome <var>
                                           ; de <tam> bytes a partir da primeira 
                                           ; posição da RAM		
vetor	SPACE 10
; -------------------------------------------------------------------------------
; Área de Código - Tudo abaixo da diretiva a seguir será armazenado na memória de 
;                  código
        AREA    |.text|, CODE, READONLY, ALIGN=2

		; Se alguma função do arquivo for chamada em outro arquivo	
        EXPORT Start                ; Permite chamar a função Start a partir de 
			                        ; outro arquivo. No caso startup.s
									
		; Se chamar alguma função externa	
        ;IMPORT <func>              ; Permite chamar dentro deste arquivo uma 
									; função <func>

; -------------------------------------------------------------------------------
; Função main()
Start  
; Comece o código aqui <======================================================
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
		
		
    ALIGN                           ; garante que o fim da seção está alinhada 
    END                             ; fim do arquivo