; Imprimer el circulo del simon en base a los colores preestablecidos
circulocompleto:

    push af
    push bc
    push de

	LD HL, fondo_pantalla      ; Cargamos el fondo ya construido previamente
    LD DE, $4000               ; Donde lo imprimiremos
    LD BC, 6912
    LDIR

    pop de
    pop bc
    pop af
    
    ret

; Imprime los textos de la derecha del circulo, en una posicion especifica, no varia
simonguide:

    push af
    push bc
    push de
    push ix 

	ld ix, relleno
    ld bc, $0019
    ld a, $0f
    call PRINTAT

    ld ix, texto1
    ld bc, $0039
    ld a, $0f
    call PRINTAT

    ld ix, textoLinea
    ld bc, $0059
    ld a, $0f
    call PRINTAT

    ld ix, relleno
    ld bc, $0079
    ld a, $0f
    call PRINTAT

    ld ix, texto2
    ld bc, $0099
    ld a, $0c
    call PRINTAT

    ld ix, texto3
    ld bc, $00b9
    ld a, $0a
    call PRINTAT

    ld ix, texto4
    ld bc, $00d9
    ld a, $0e
    call PRINTAT

    ld ix, texto5
    ld bc, $00f9
    ld a, $0D
    call PRINTAT

    ld ix, textoLinea
    ld bc, $0819
    ld a, $0f
    call PRINTAT

    ld ix, relleno
    ld bc, $0839
    ld a, $0f
    call PRINTAT

    ld ix, relleno
    ld bc, $0879
    ld a, $1f
    call PRINTAT

    ld ix, textopunt
    ld bc, $0899
    ld a, $1f
    call PRINTAT

    ld ix, textoLinea
    ld bc, $08b9
    ld a, $1f
    call PRINTAT

    ld ix, relleno
    ld bc, $08d9
    ld a, $1f
    call PRINTAT

    ld ix, numeropuntuacion
    ld bc, $08f9
    ld a, $1f
    call PRINTAT

    ld ix, textoLinea
    ld bc, $1019
    ld a, $1f
    call PRINTAT

    ld ix, relleno
    ld bc, $1039
    ld a, $1f
    call PRINTAT

    ld ix, relleno
    ld bc, $1079
    ld a, $38
    call PRINTAT

    ld ix, textoNivel
    ld bc, $1099
    ld a, $38
    call PRINTAT
 
    ld ix, textoLinea
    ld bc, $10b9
    ld a, $38
    call PRINTAT

    ld ix, relleno
    ld bc, $10d9
    ld a, $38
    call PRINTAT

    ld ix, numeropuntuacion1
    ld bc, $10f9
    ld a, $3a
    call PRINTAT

    ld ix, iniciales
    ld bc, $1700
    ld a, $07
    call PRINTAT

    pop ix
    pop de
    pop bc
    pop af

    ret

; Imprime la pantalla del inicio del juego
bienvenida:
    call CLEARSCR

    ld ix, hola1
    ld bc, $0001
    ld a, $03
    call PRINTAT

    ld ix, hola2
    ld bc, $0500
    ld a, $03
    call PRINTAT

    ld ix, hola3
    ld bc, $0700
    ld a, $04
    call PRINTAT

    ld ix, hola4
    ld bc, $0800
    ld a, $04
    call PRINTAT

    ld ix, hola5
    ld bc, $0900
    ld a, $04
    call PRINTAT

    ld ix, hola6
    ld bc, $0B00
    ld a, $02
    call PRINTAT

    ld ix, hola7
    ld bc, $0C00
    ld a, $02
    call PRINTAT

    ld ix, hola8
    ld bc, $0E00
    ld a, $06
    call PRINTAT

    ld ix, hola9
    ld bc, $1000
    ld a, $05
    call PRINTAT

    ld ix, hola10
    ld bc, $1704
    ld a, $07
    call PRINTAT

    ret

; Recive una cadena de numeros en ix, la pasa a todo a 0
vaciar:

    ld a, (ix)

    cp 0            ; Esta vacia
    jp z, finaux
    cp 25
    jp z, finaux

    ld (ix), 0
    inc ix
    jp vaciar

finaux:
    ret

; Imprime la pantalla de derrota
adios:
    call CLEARSCR

    ld a, 5
    call sonidoColor

    LD A,2                ; Color rojo
    OUT ($FE),A           ; Pintamos el borde

    ld ix, adios1
    ld bc, $0108
    ld a, $07
    call PRINTAT

    ld ix, adios2
    ld bc, $1603
    ld a, $06
    call PRINTAT

    ret

; Imprime la pantalla de derrota
ganaste:

    call CLEARSCR

    LD A,4               ; Color rojo
    OUT ($FE),A          ; Pintamos el borde

    ld ix, ganar1
    ld bc, $0108
    ld a, $07
    call PRINTAT

    ld ix, adios2
    ld bc, $1603
    ld a, $06 
    call PRINTAT

    ret

; Cargar el fonde de pantalla, esta funcion apoya a la funcion circulocompleto
fondo_pantalla:
    INCBIN "fondo.scr"
    ret

; Funcion que espera a que se pulse una tecla, indefinidamente la que sea
esperartecla:     ; Espera a que se pulse una tecla  
    XOR A
    IN A, (254)
    OR 224
    INC A
    JP Z, esperartecla
    ret
