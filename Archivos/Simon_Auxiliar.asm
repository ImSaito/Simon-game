; -------------------------------
; ZX Spectrum Pause library
; Daniel León - AOC - UFV 2021
; -------------------------------

;--------------------------------------------------------------------------------------------
; Funcion pausa - Recibe en B y en DE la longitud de la pausa de duración BDE
;--------------------------------------------------------------------------------------------
pausa: 	push af							; Salva registros utilizados en la pila
		push de

paus0:  pop de 							; Recupera el valor orginal de DE
		push de
paus1:	dec de 							; Decrementa DE. En la primera vuelta, DE valdrá 65535
		ld a,d 							; Para comprobar si DE es 0000, D tiene que ser 0...
		or e 							; ... y E también
		jr nz, paus1					; Si no lo es, sigue el bucle inteno
		
		djnz paus0                      ; B=B-1 y cicla a bucle externo hasta que B sea 0

		pop de 							; Recupera registros utilizados desde la pila
		pop af

		ret 							; Retorna al punto de llamada		


;--------------------------------------------------------------------------------------------
; Funciones pausa pequeña y grande - Fijan B y DE predefinidos y llaman a pausa
;--------------------------------------------------------------------------------------------
pausaPeq:		push bc 				; Salvar registros
				push de
				ld b,32 				; Fijar duraciones BDE
				ld de, $400
				call pausa 				; Llamar a pausa
				pop de 					; Recuperar registros
				pop bc
				ret 					; Retornar al punto de llamada

pausaGrande:	push bc 				; Salvar registros
				push de
				ld b,128 				; Fijar duraciones BDE
				ld de, $400
				call pausa 				; Llamar a pausa
				pop de 					; Recuperar registros
				pop bc
				ret 					; Retornar al punto de llamada