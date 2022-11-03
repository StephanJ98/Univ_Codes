
_main:

;p3a.c,1 :: 		void main() {
;p3a.c,2 :: 		char aux = 0;
	CLRF        main_aux_L0+0 
;p3a.c,3 :: 		RBPU_bit = 0;
	BCF         RBPU_bit+0, BitPos(RBPU_bit+0) 
;p3a.c,5 :: 		TRISB.B0 = 1;
	BSF         TRISB+0, 0 
;p3a.c,6 :: 		TRISB.B1 = 0;
	BCF         TRISB+0, 1 
;p3a.c,8 :: 		PORTB.B1 = 0;
	BCF         PORTB+0, 1 
;p3a.c,11 :: 		while(1){
L_main0:
;p3a.c,12 :: 		if (PORTB.B0 == 0 && aux == 1){
	BTFSC       PORTB+0, 0 
	GOTO        L_main4
	MOVF        main_aux_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main4
L__main6:
;p3a.c,13 :: 		PORTB.B1 = !PORTB.B1;
	BTG         PORTB+0, 1 
;p3a.c,14 :: 		}
L_main4:
;p3a.c,15 :: 		aux = PORTB.B0;
	MOVLW       0
	BTFSC       PORTB+0, 0 
	MOVLW       1
	MOVWF       main_aux_L0+0 
;p3a.c,16 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	DECFSZ      R11, 1, 1
	BRA         L_main5
	NOP
;p3a.c,18 :: 		}
	GOTO        L_main0
;p3a.c,19 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
