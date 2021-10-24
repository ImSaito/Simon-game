; Personas:
  ; David Pujo Velez
  ; Carlos Pereza 
  ; Pablo Quetin

; Este archivo contendra todas las referencias a otros archivos necesarios


	OUTPUT "SimonV1.bin" ; Archivo a ejecutar

	ORG $8000                     ; Memoria en esa posicion
	di                            ; Interrupciones deshabilitadas
	ld sp,0                       ; Pila al final

inicio:                         ; ETAPA 0 - INICIO DEL JUEGO     

  LD A,0                        ; BORDE COLOR
  OUT ($FE),A                   ; BORDE PINTAR

  call CLEARSCR
  call bienvenida               ; Pinta la bienvenida   
  call esperartecla
	call circulocompleto          ; Pintar el simon
  ;call simonguide              ; Pintar la guia del simon

  ld ix, jugadaintro            ; Pintar jugada de la intro
  call imprimirjugadaintro      ; Imprime un orden de jugada de simon

main:                           ; ETAPA 1 - JUEGO/JUGAR

  call pausaPeq                 ; Pausa pequeña

  ld ix, jugadarandom           ; Cargamos la jugada a rellenar 
  call random                   ; Añadimos un numero mas en la cadena + Imprimirlo

  ld ix, jugadarandom           ; Cargamos la jugada a rellenar
  ld c, 0
  call jugar                    ; Guarda los valores introducidos + Imprimirlo + Puntuacion

  call pausaPeq                 ; Pausa pequeña

  jp main                       ; Bucle infinito hasta que se salga con el exit

terminar:                       ; ETAPA 2 - PERDER          

  ld ix, jugadarandom
  call vaciar                   ; Reseteamos el array de la jugada random
  call adios                    ; Pantalla hemos perdido
  call esperartecla             ; Se espera a una tecla
  call inicio                   ; Se vuelve al principio

ganador:                        ; ETAPA 3 - GANAR 

  ld ix, jugadarandom
  call vaciar                   ; Reset del array
  call ganaste                  ; Pantalla hemos ganado
  call esperartecla             ; Se espera a una tecla
  call inicio                   ; Se vuelve al principio


  ; Includes:
  include "Archivos/teclas.asm"
  include "Archivos/imprimir.asm"
  include "Archivos/pintar.asm"
  include "Archivos/random.asm"
  include "Archivos/aleatorio.asm"
  include "Archivos/jugar.asm"
  include "Archivos/Simon_Empezar.asm"
  include "Archivos/cadenas.asm"
  include "Archivos/Simon_Auxiliar.asm"
  include "Archivos/Simon_Print_Text.asm"
  include "Archivos/Simon_Sound.asm"
  include "Archivos/charset.bin"
