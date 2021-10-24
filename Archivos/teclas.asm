teclado:             ; Devuelve en a el valor de la tecla pulsada

esperar_tecla:       ; Espera a que se pulse una tecla   
  XOR A
  IN A, (254)
  OR 224
  INC A
  JP Z, esperar_tecla

teclado_q:           ; Pulsa tecla Q

  ld bc, $FBFE
  in a,(c)
  bit 0, a
  JP Z, pulsaQ


teclado_w:           ; Pulsa tecla W

  ld bc, $FBFE
  in a,(c)
  bit 1, a      
  JP Z, pulsaW

teclado_a:           ; Pulsa tecla A

  ld bc, $FDFE
  in a,(c)
  bit 0, a
  JP Z, pulsaA

teclado_s:           ; Pulsa tecla S

  ld bc, $FDFE
  in a,(c)
  bit 1, a
  JP Z, pulsaS

  ;pop de
  ;pop bc
  ;pop af
  ret

