; Cadenas de caracteres

; Cadenas guia
texto1: 			defm " SIMON ",0
texto2:				defm "Q:Verde",0
texto3: 			defm "W:Rojo ",0
texto4: 			defm "A:Amar.",0
texto5: 			defm "S:Azul ",0
relleno: 			defm "       ",0
textoLinea: 		defm "_______",0
textopunt: 			defm " PUNT. ",0
numeropuntuacion: 	defm "  000  ",0
numeropuntuacion1: 	defm "  25p  ",0
textoNivel: 		defm " META: ",0
iniciales: 			defm " D-P-C 2021",0

; Cadenas pantalla bienvenida
hola1:   			defm " - Bienvenido al SuperSIMON - ",0
hola2:				defm "Las reglas son las siguientes:",0
hola3:				defm "-El juego realizara una jugada",0
hola4:				defm "automatica, debes de repetirla",0
hola5:				defm "para ir sumando puntos.",0
hola6:				defm "- Si te equivocas perderas una",0
hola7:				defm "vida.",0
hola8:				defm "- Solo posees una vida.",0
hola9:				defm "- Si llegas a 25 puntos ganas.",0
hola10:   			defm "Teclea y podras jugarlo",0

; Cadenas pantalla derrota
adios1:   			defm " - HAS MUERTO - ",0
adios2:   			defm "Teclea para volver a jugar",0

; Cadenas pantalla victoria, reutilizaremos adios2 para esta pantalla
ganar1:   			defm " - HAS GANADO - ",0

; Cadenas de numeros
numeronivel: 		db 000
jugadaintro: 	  	db 1,2,3,4,1,2,3,4,1,2,3,4,1,2,3,4,0
jugadarandom: 		db 0,25,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,25	; Jugada random de 25 de longitud, el 25 del final nos ayuda a saber si hemos ganado