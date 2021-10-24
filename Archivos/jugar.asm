; Recibe una cadena en IX donde quedara registrada tu jugada

; 0 - Final de la cadena
; 1 - Cuadrado arriba a la izquierda
; 2 - Cuadrado arriba a la derecha
; 3 - Cuadrado abajo a la izquierda
; 4 - Cuadrado abajo a la derecha

; Funcion que corresponde a tu jugada, esta en un bucle hasta que no hay nada, y va de longitud de la jugada que recibe en ix
; Primero ve que numero contiene la cadena que has pasado.
; Luego te pasa a otra rutina que te deja insertar una tecla, si corresponde con la de la jugada que tienes que repetir,
; pasa al siguiente numero, si no directamente mueres.
jugar: 

	ld a, (ix)

	; Primero se lee la jugada que has pasado en ix
	cp 1 				; Random = verde
	jr z, casoverde
	cp 2 				; Random = rojo
	jr z, casorojo
	cp 3 				; Random = amarillo
	jr z, casoamarillo
	cp 4 				; Random = azul
	jr z, casoazul
	cp 0				; Se ha acabado la cadena
	jr z, casonoexiste
	cp 25               ; Has ganado
	jp z, ganador

	jr jugar

; Una vez leida se pasa al comparador correspondiente

; Comparador con el verde
casoverde:
	inc ix
	inc c
	call teclado		; Devuelve en a el valor introducido
	cp 1				; Ha introducido bien
	jr z, jugar
	jp fin2

; Comparador con el rojo
casorojo:
	inc ix
	inc c
	call teclado		; Devuelve en a el valor introducido
	cp 2				; Ha introducido bien
	jr z, jugar
	jp fin2

; Comparador con el amarillo
casoamarillo:
	inc ix
	inc c
	call teclado		; Devuelve en a el valor introducido
	cp 3				; Ha introducido bien
	jr z, jugar
	jp fin2

; Comparador con el azul
casoazul:
	inc ix
	inc c
	call teclado		; Devuelve en a el valor introducido
	cp 4				; Ha introducido bien
	jr z, jugar
	jp fin2

; Finalizaciond de la cadena, retornamos a donde estabamos. Imprimimos la puntuacioin
casonoexiste:
	call puntuacion		; Recibe en C la longitud
	ret

; Si te equivocas se invoca a la funcion correspondiente a perder
fin2:
	call terminar



puntuacion:
	ret
