; Recibe una cadena en IX y la imprime

; 0 - Final de la cadena
; 1 - Cuadrado arriba a la izquierda
; 2 - Cuadrado arriba a la derecha
; 3 - Cuadrado abajo a la izquierda
; 4 - Cuadrado abajo a la derecha

; Funcion que recibe en ix una cadena y la imprime iluminando el color que corresponde en el simon
imprimirjugada: 

	ld a, (ix)
	inc ix

	cp 1 				; Color verde
	jr z, caso1
	cp 2 				; Color rojo
	jr z, caso2
	cp 3 				; Color amarillo
	jr z, caso3
	cp 4 				; Color azul
	jr z, caso4
	cp 0				; Resetear simon
	jr z, fin

	jr imprimirjugada

caso1:
	push af
	call pulsaQ
	pop af
	jr imprimirjugada

caso2:
	push af
	call pulsaW
	pop af
	jr imprimirjugada

caso3:
	push af
	call pulsaA
	pop af
	jr imprimirjugada

caso4:
	push af
	call pulsaS
	pop af
	jr imprimirjugada


fin:
	ret


; Funcion como imprimirjugada, pero sin el sonido.
imprimirjugadaintro: 

	ld a, (ix)
	inc ix

	cp 1 				; Color verde
	jr z, caso1intro
	cp 2 				; Color rojo
	jr z, caso2intro
	cp 3 				; Color amarillo
	jr z, caso3intro
	cp 4 				; Color azul
	jr z, caso4intro
	cp 0				; Resetear simon
	jr z, finintro

	jr imprimirjugadaintro

caso1intro:
	push af
	ld hl, $5800			; Pulsa Q
  	ld b, 11	
	call pintar1
	call circulocompleto	; Imprimimos el simon
	;call simonguide			; Imprimirmos la guia
	pop af
	jr imprimirjugadaintro

caso2intro:
	push af
	ld hl, $580D			; Pulsa W
    ld b, 11
	call pintar2
	call circulocompleto	; Imprimimos el simon
	;call simonguide			; Imprimirmos la guia
	pop af
	jr imprimirjugadaintro

caso3intro:
	push af
	ld hl, $5980			; Pulsa A
    ld b, 11
	call pintar3
	call circulocompleto	; Imprimimos el simon
	;call simonguide			; Imprimirmos la guia
	pop af
	jr imprimirjugadaintro

caso4intro:
	push af
	ld hl, $598D			; Pulsa S
  	ld b, 11
	call pintar4
	call circulocompleto	; Imprimimos el simon
	;call simonguide			; Imprimirmos la guia
	pop af
	jr imprimirjugadaintro


finintro:
	call simonguide
	call pausaPeq
	call pausaPeq
	ret
