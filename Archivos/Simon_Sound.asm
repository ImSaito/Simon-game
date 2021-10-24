;--------------------------------------------------------------------------------------------
; Funcion sonidoColor: Recibe un valor de 1 a 4 en A para el color y genera un pitido
;					   Además, si recibe un 5, genera un sonido que puede ser usado para error
;--------------------------------------------------------------------------------------------
sonidoColor:
		push ix						; Salva registros

		push af

		ld ix, tablaSonidos			; Apunta a una tabla con frecuencias y duraciones de sonidos
		dec a 						; Convierte la entrada 1..4 en 0..3
		sla a 						; Ahora A es 0,2,4 o 6 para sonidos y 8 para error
		ld d,0
		ld e,a
		add ix,de 					; Se añade ese numero al puntero de la tabla de sonidos ...
									; ... porque cada sonido tiene 2 bytes de datos
		ld b,(ix) 					; Cargamos en B la frecuencia ...
		ld e,(ix+1) 				; ... y en e la duración
		call sonido 				; Llamada al generador de sonido

		pop af 						; Recuperación de registros

		pop ix

		ret 						; Retorno al punto de llamada


;--------------------------------------------------------------------------------------------
; Funcion sonido: Genera un pitido en el altavoz alternando el estado 0 y 1 con un periodo
;				  determinado por B y una duración fijada en E (onda cuadrada)
;--------------------------------------------------------------------------------------------
sonido:	
		ld c, altavozON				; C contiene el dato que espera la ULA para encender el altavoz
		ld h, b 					; Salvar el dato del periodo en h
sonBuc0: 							; Bucle externo, que determina la duración
		ld b, h  					; Se recargan los datos de pausa para el periodo
		ld a,c 						; Dato de altavoz ON / OFF a A
		out ($fe),a 				; Enviado a la ULA
		xor altavozMsk 				; Al hacer un XOR con esta máscara, el dato en A cambiará entre 10 y 00
sonBuc1: 							; Bucle interno, que determina el periodo. El tiempo que la señal está encencida o apagada
		ex (sp),hl 					; Estas instrucciones son muy largas (19 ciclos cada una) y, tras ejecutarse, ...
		ex (sp),hl					; ... no tienen efecto en registros o memoria. Se usan para hacer que este bucle tarde más 
		ex (sp),hl
		ex (sp),hl
		djnz sonBuc1
		
		dec e 						; Bucle externo
		ld c,a 						; Volvemos a poner el estado ON/OFF del altavoz en c
		jr nz,  sonBuc0

		ret 						; Retorno de la función


;--------------------------------------------------------------------------------------------
; Tablas y constantes usadas por las funciones
;--------------------------------------------------------------------------------------------
tablaSonidos: db $C0,$40, $90,$60, $60,$90, $4D,$C0, $FF,$40 ; periodo y duración por cada sonido
altavozON	EQU $10					; Bit 5 de la ULA a 1 para encender el altavoz
altavozMsk	EQU $10  				; Un XOR con esta máscara cambia el bit 5 entre 0 y 1