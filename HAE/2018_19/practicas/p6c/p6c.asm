
_interrupt:

;p6c.c,2 :: 		void interrupt() {
;p6c.c,3 :: 		if (INTCON3.INT1IF == 1 && INTCON3.INT1IE == 1) {
	BTFSS       INTCON3+0, 0 
	GOTO        L_interrupt2
	BTFSS       INTCON3+0, 3 
	GOTO        L_interrupt2
L__interrupt11:
;p6c.c,4 :: 		PORTC.B0 = 1;
	BSF         PORTC+0, 0 
;p6c.c,5 :: 		T0CON = 0x84;
	MOVLW       132
	MOVWF       T0CON+0 
;p6c.c,6 :: 		TMR0H = (3036>>8);
	MOVLW       11
	MOVWF       TMR0H+0 
;p6c.c,7 :: 		TMR0L = 3036;
	MOVLW       220
	MOVWF       TMR0L+0 
;p6c.c,8 :: 		INTCON3.INT1IF = 0;
	BCF         INTCON3+0, 0 
;p6c.c,9 :: 		INTCON3.INT1IE = 0;
	BCF         INTCON3+0, 3 
;p6c.c,10 :: 		}
L_interrupt2:
;p6c.c,11 :: 		if (INTCON.TMR0IF && INTCON.TMR0IE) {
	BTFSS       INTCON+0, 2 
	GOTO        L_interrupt5
	BTFSS       INTCON+0, 5 
	GOTO        L_interrupt5
L__interrupt10:
;p6c.c,12 :: 		INTCON.TMR0IF = 0;
	BCF         INTCON+0, 2 
;p6c.c,13 :: 		seg++;
	INCF        _seg+0, 1 
;p6c.c,14 :: 		if (seg < 3){
	MOVLW       3
	SUBWF       _seg+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_interrupt6
;p6c.c,15 :: 		TMR0H = (3036>>8);
	MOVLW       11
	MOVWF       TMR0H+0 
;p6c.c,16 :: 		TMR0L = 3036;
	MOVLW       220
	MOVWF       TMR0L+0 
;p6c.c,18 :: 		} else {
	GOTO        L_interrupt7
L_interrupt6:
;p6c.c,19 :: 		PORTC.B0 = 0;
	BCF         PORTC+0, 0 
;p6c.c,20 :: 		INTCON3.INT1IF = 0;
	BCF         INTCON3+0, 0 
;p6c.c,21 :: 		INTCON3.INT1IE = 1;
	BSF         INTCON3+0, 3 
;p6c.c,22 :: 		}
L_interrupt7:
;p6c.c,23 :: 		}
L_interrupt5:
;p6c.c,24 :: 		}
L_end_interrupt:
L__interrupt13:
	RETFIE      1
; end of _interrupt

_main:

;p6c.c,25 :: 		void main() {
;p6c.c,26 :: 		TRISB.B1 = 1;
	BSF         TRISB+0, 1 
;p6c.c,27 :: 		TRISC.B0 = 0;
	BCF         TRISC+0, 0 
;p6c.c,28 :: 		PORTC.B0 = 0;
	BCF         PORTC+0, 0 
;p6c.c,29 :: 		INTCON2.INTEDG1 = 1;
	BSF         INTCON2+0, 5 
;p6c.c,30 :: 		INTCON3.INT1IF = 0;
	BCF         INTCON3+0, 0 
;p6c.c,31 :: 		INTCON3.INT1IE = 1;
	BSF         INTCON3+0, 3 
;p6c.c,32 :: 		INTCON.TMR0IF = 0;
	BCF         INTCON+0, 2 
;p6c.c,33 :: 		INTCON.TMR0IE = 1;
	BSF         INTCON+0, 5 
;p6c.c,34 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;p6c.c,36 :: 		while(1);
L_main8:
	GOTO        L_main8
;p6c.c,37 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
