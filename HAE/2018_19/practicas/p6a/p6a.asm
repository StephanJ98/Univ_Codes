
_interrupt:

;p6a.c,1 :: 		void interrupt() {
;p6a.c,2 :: 		if(PORTC.B0 == 1){
	BTFSS       PORTC+0, 0 
	GOTO        L_interrupt0
;p6a.c,3 :: 		PORTC.B0 = 0;
	BCF         PORTC+0, 0 
;p6a.c,4 :: 		T0CON = 0xC2;
	MOVLW       194
	MOVWF       T0CON+0 
;p6a.c,5 :: 		TMR0L = 81;
	MOVLW       81
	MOVWF       TMR0L+0 
;p6a.c,6 :: 		} else {
	GOTO        L_interrupt1
L_interrupt0:
;p6a.c,7 :: 		PORTC.B0 = 1;
	BSF         PORTC+0, 0 
;p6a.c,8 :: 		T0CON = 0xC1;
	MOVLW       193
	MOVWF       T0CON+0 
;p6a.c,9 :: 		TMR0L = 106;
	MOVLW       106
	MOVWF       TMR0L+0 
;p6a.c,10 :: 		}
L_interrupt1:
;p6a.c,11 :: 		INTCON.TMR0IF = 0;
	BCF         INTCON+0, 2 
;p6a.c,12 :: 		}
L_end_interrupt:
L__interrupt5:
	RETFIE      1
; end of _interrupt

_main:

;p6a.c,13 :: 		void main() {
;p6a.c,14 :: 		TRISC.B0 = 0;
	BCF         TRISC+0, 0 
;p6a.c,15 :: 		PORTC.B0 = 1;
	BSF         PORTC+0, 0 
;p6a.c,16 :: 		T0CON = 0xC1;
	MOVLW       193
	MOVWF       T0CON+0 
;p6a.c,17 :: 		INTCON.TMR0IF = 0;
	BCF         INTCON+0, 2 
;p6a.c,18 :: 		INTCON.TMR0IE = 1;
	BSF         INTCON+0, 5 
;p6a.c,19 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;p6a.c,20 :: 		TMR0L = 106;
	MOVLW       106
	MOVWF       TMR0L+0 
;p6a.c,23 :: 		while(1);
L_main2:
	GOTO        L_main2
;p6a.c,24 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
