; Recibe una jugada en ix
; Y la inserta un numero random
random:

	ld a, (ix)

	cp 1 						; Color verde
	jp z, casovalor
	cp 2 						; Color rojo
	jp z, casovalor
	cp 3 						; Color amarillo
	jp z, casovalor
	cp 4 						; Color azul
	jp z, casovalor
	cp 0						; Resetear simon
	jp z, casonovalor
	cp 25
	jp z, fin1

	jp random

casovalor:						; Ya posee valor pasamos al siguiente
	inc ix
	jp random
	
casonovalor:					; Un 0 -> Añadimos otro numero

	ld a, 4
	call randomnumber			; Recibe en a un numero como rango de [0-A)
	inc a
	ld (ix), a
	; -------- Impresion ------------
	ld ix, jugadarandom
	call imprimirjugada
	; -------- Impresion ------------
	jp fin1


fin1:
	ret

