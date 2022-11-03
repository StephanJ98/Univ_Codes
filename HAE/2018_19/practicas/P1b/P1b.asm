
_main:

;P1b.c,2 :: 		void main() {
;P1b.c,3 :: 		ADCON1 = 0x07;
	MOVLW       7
	MOVWF       ADCON1+0 
;P1b.c,4 :: 		TRISC = 0;
	CLRF        TRISC+0 
;P1b.c,5 :: 		PORTC = 0;
	CLRF        PORTC+0 
;P1b.c,7 :: 		while (1) {
L_main0:
;P1b.c,8 :: 		PORTC = x;
	MOVF        _x+0, 0 
	MOVWF       PORTC+0 
;P1b.c,9 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
;P1b.c,10 :: 		PORTC = 0;
	CLRF        PORTC+0 
;P1b.c,11 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
	NOP
;P1b.c,12 :: 		x = (x << 1);
	MOVF        _x+0, 0 
	MOVWF       R1 
	RLCF        R1, 1 
	BCF         R1, 0 
	MOVF        R1, 0 
	MOVWF       _x+0 
;P1b.c,13 :: 		if (x == 0){
	MOVF        R1, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main4
;P1b.c,14 :: 		x = 1;
	MOVLW       1
	MOVWF       _x+0 
;P1b.c,15 :: 		}
L_main4:
;P1b.c,16 :: 		}
	GOTO        L_main0
;P1b.c,17 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
