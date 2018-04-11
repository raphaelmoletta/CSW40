; -----------------------------------------------------------------
; Programa para deslocamento dos leds
; ------------------------------------------------------------------
org 0000h

ACENDE:
		CLR P3.6
		acall delay
		CLR P3.7
		acall delay
		CLR P1.4
		acall delay
		CPL P1.4
		acall delay
		CPL P3.7
		acall delay
		CPL P3.6
		acall delay
		JMP ACENDE
		




;-----Rotina de delay---------	
delay:	 		mov r0,#8d
loop1:	      	mov r1,#250d
loop:			mov R2,#250d
               	djnz r2,$ ; jump para a mesma linha
		      	djnz r1,loop
				djnz r0,loop1
	            ret

;-----------------------------

end      
