
/*
------------------Intermintencia -----------------------------
*/
ser r16
out ddrd, r16 ; inicializar puerto d como salida

/*
------------------Programa principal-----------------------------
*/
main:
	;desplazamiento izquierda
	ldi r16, 1	//inicializar a 1 
	repetir: 
		out portd, r16	//mandar el registro al puerto d

		call funcionDelay50ms	

		//mov r15, r16
		//add r16, r15
		lsl r16	//desplazar el valor a la izquierda	
		inc r16	//añadir un uno a la derecha del todo
		cpi r16,255	//comprobar si no tiene el valor maximo, si lo tiene salta la sigueinte linea
		brne repetir
	
	; apagar leds Funciona el apagado
	out portd, r16

	call funcionDelay1000ms

	clr r16	//limpiar el registro 16 para volverlo a usar
		out portd, r16

		call funcionDelay1000ms

rjmp main

/*
------------------Fin programa principal-----------------------------
*/

/******************************************
        Función Delay 50ms
******************************************/
funcionDelay50ms:
        push r18                ;debuelvo a los registros 18,19,20 la información que tenían
        push r19
        push r20
 
        ldi  r18, 3
    ldi  r19, 8
    ldi  r20, 120
L1: dec  r20
    brne L1
    dec  r19
    brne L1
    dec  r18
    brne L1
 
        pop r20                 ;quito a los registros 18,19,20 la información que tenían (se quita no se borra)
        pop r19
        pop r18
        ret                             ;vuelvo al código
        ;fin delay 50ms
 
/******************************************
        Función Delay 1sec
******************************************/
funcionDelay1000ms:
        push r18                ;debuelvo a los registros 18,19,20 la información que tenían
        push r19
        push r20
 
        ldi  r18, 41
    ldi  r19, 150
    ldi  r20, 128
L2: dec  r20
    brne L2
    dec  r19
    brne L2
    dec  r18
    brne L2
 
        pop r20                 ;quito a los registros 18,19,20 la información que tenían (se quita no se borra)
        pop r19
        pop r18
        ret                             ;vuelvo al código
        ;fin delay 1sec
 
/******************************************
        Función Delay 1min
******************************************/
funcionDelay1min:
        push r20                ;debuelvo a los registros 18,19,20 la información que tenían
        push r21
        push r22
		push r23

          ldi  r20, 20
    ldi  r21, 7
    ldi  r22, 21
    ldi  r23, 137
L3: dec  r23
    brne L3
    dec  r22
    brne L3
    dec  r21
    brne L3
    dec  r20
    brne L3
    rjmp PC+1
 
		pop r23
        pop r22               ;quito a los registros 18,19,20 la información que tenían (se quita no se borra)
        pop r21
        pop r20
        ret                             ;vuelvo al código
        ;fin delay 500ms
