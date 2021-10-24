; Contiene las respectivas funciones que se realizan una vez pulsado una tecla, y ya sabiendo cual has pulsado


; Has pulsado la Q
pulsaQ:						
	push af

	ld hl, $5800			; Cargamos la direccion de memoria en la que pintaremos
  	ld b, 11				; La longitud del cuadrado que pintaremos, en este caso 11x11
  	call pintar1            ; en b el tamaño, en hl la posicion, y se pintara el cuadrado

	ld a, 1 				; Numero del sonido al que llamaremos
	call sonidoColor		; Pasamos en a el numero de sonido que queremos
	call circulocompleto	; Imprimimos el simon
	call simonguide			; Imprimirmos la guia
	pop af
	ld a, 1 				; Devolvemos la tecla que hemos pulsado
	ret

; Has pulsado la W
pulsaW:
	push af

	ld hl, $580D			; Cargamos la direccion de memoria en la que pintaremos
    ld b, 11				; La longitud del cuadrado que pintaremos, en este caso 11x11
    call pintar2            ; en b el tamaño, en hl la posicion, y se pintara el cuadrado

	; Sonido:
	ld a, 2 				; Numero del sonido al que llamaremos
	call sonidoColor		; Pasamos en a el numero de sonido que queremos
	call circulocompleto	; Imprimimos el simon
	call simonguide			; Imprimirmos la guia
	pop af
	ld a, 2 				; Devolvemos la tecla que hemos pulsado
	ret

; Has pulsado la A
pulsaA:
	push af

	ld hl, $5980			; Cargamos la direccion de memoria en la que pintaremos
    ld b, 11				; La longitud del cuadrado que pintaremos, en este caso 11x11
    call pintar3            ; en b el tamaño, en hl la posicion, y se pintara el cuadrado
	
	; Sonido:
	ld a, 3 				; Numero del sonido al que llamaremos
	call sonidoColor		; Pasamos en a el numero de sonido que queremos
	call circulocompleto	; Imprimimos el simon
	call simonguide			; Imprimirmos la guia
	pop af
	ld a, 3 				; Devolvemos la tecla que hemos pulsado
	ret

; Has pulsado la S
pulsaS:
	push af

  	ld hl, $598D			; Cargamos la direccion de memoria en la que pintaremos
  	ld b, 11				; La longitud del cuadrado que pintaremos, en este caso 11x11
  	call pintar4            ; en b el tamaño, en hl la posicion, y se pintara el cuadrado
 
	; Sonido:
	ld a, 4 				; Numero del sonido al que llamaremos
	call sonidoColor		; Pasamos en a el numero de sonido que queremos
	call circulocompleto	; Imprimimos el simon
	call simonguide			; Imprimirmos la guia
	pop af
	ld a, 4 				; Devolvemos la tecla que hemos pulsado
	ret

;  pintarN
;  Recibe en Hl la posicion de memoria y en b el tamaño
;  Pinta en un color preestablecido en un cuadrado de bxb en la posicion de hl como punto de comienzo

pintar1:

	ld a, 68 			; Color en el que pintar (verde brillante)
	ld de, 20

	push bc
	ld b, 12
bucle1:
	ld (hl), a
	inc hl
	djnz bucle1 		; Bucle de solo el tamaño del VERDE (lateralmente)
	pop bc
	add hl, de
	djnz pintar1

	ret


pintar2:

	ld a, 66 			; Color en el que pintar (rojo brillante)
	ld de, 20

	push bc
	ld b, 12
bucle2:
	ld (hl), a
	inc hl
	djnz bucle2 		; Bucle de solo el tamaño del ROJO (lateralmente)
	pop bc
	add hl, de
	djnz pintar2

	ret

pintar3:

	ld a, 70 			; Color en el que pintar (amarillo brillante)
	ld de, 20

	push bc
	ld b, 12
bucle3:
	ld (hl), a
	inc hl
	djnz bucle3			; Bucle de solo el tamaño del AMARILLO (lateralmente)
	pop bc
	add hl, de
	djnz pintar3

	ret

pintar4:

	ld a, 69  			; Color en el que pintar (azul brillante)
	ld de, 20

	push bc
	ld b, 12
bucle4:
	ld (hl), a
	inc hl
	djnz bucle4 		; Bucle de solo el tamaño del AZUL (lateralmente)
	pop bc
	add hl, de
	djnz pintar4

	ret




