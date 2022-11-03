
_interrupt:

;p3b.c,1 :: 		void interrupt(){
;p3b.c,2 :: 		PORTB.B1 = !PORTB.B1;
	BTG         PORTB+0, 1 
;p3b.c,3 :: 		INTCON.INT0IF = 0;
	BCF         INTCON+0, 1 
;p3b.c,5 :: 		}
L_end_interrupt:
L__interrupt3:
	RETFIE      1
; end of _interrupt

_main:

;p3b.c,7 :: 		void main() {
;p3b.c,8 :: 		RBPU_bit = 0;
	BCF         RBPU_bit+0, BitPos(RBPU_bit+0) 
;p3b.c,9 :: 		TRISB.B0 = 1;
	BSF         TRISB+0, 0 
;p3b.c,10 :: 		TRISB.B1 = 0;
	BCF         TRISB+0, 1 
;p3b.c,11 :: 		PORTB.B1 = 0;
	BCF         PORTB+0, 1 
;p3b.c,13 :: 		INTCON2.INTEDG0 = 0;
	BCF         INTCON2+0, 6 
;p3b.c,14 :: 		INTCON.INT0IF = 0;
	BCF         INTCON+0, 1 
;p3b.c,15 :: 		INTCON.INT0IE = 1;
	BSF         INTCON+0, 4 
;p3b.c,16 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;p3b.c,18 :: 		while(1);
L_main0:
	GOTO        L_main0
;p3b.c,20 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
