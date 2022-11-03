
_interrupt:

;p3c.c,4 :: 		void interrupt(){
;p3c.c,5 :: 		uds++;
	INCF        _uds+0, 1 
;p3c.c,6 :: 		if (uds == 10){
	MOVF        _uds+0, 0 
	XORLW       10
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt0
;p3c.c,7 :: 		uds = 0;
	CLRF        _uds+0 
;p3c.c,8 :: 		dec++;
	INCF        _dec+0, 1 
;p3c.c,9 :: 		}
L_interrupt0:
;p3c.c,10 :: 		if (dec == 10){
	MOVF        _dec+0, 0 
	XORLW       10
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt1
;p3c.c,11 :: 		dec = 0;
	CLRF        _dec+0 
;p3c.c,12 :: 		}
L_interrupt1:
;p3c.c,14 :: 		INTCON.INT0IF = 0;
	BCF         INTCON+0, 1 
;p3c.c,15 :: 		}
L_end_interrupt:
L__interrupt7:
	RETFIE      1
; end of _interrupt

_main:

;p3c.c,17 :: 		void main() {
;p3c.c,18 :: 		char digitos[] = {63, 6, 91, 79, 102, 109, 125, 7, 127, 111};
	MOVLW       63
	MOVWF       main_digitos_L0+0 
	MOVLW       6
	MOVWF       main_digitos_L0+1 
	MOVLW       91
	MOVWF       main_digitos_L0+2 
	MOVLW       79
	MOVWF       main_digitos_L0+3 
	MOVLW       102
	MOVWF       main_digitos_L0+4 
	MOVLW       109
	MOVWF       main_digitos_L0+5 
	MOVLW       125
	MOVWF       main_digitos_L0+6 
	MOVLW       7
	MOVWF       main_digitos_L0+7 
	MOVLW       127
	MOVWF       main_digitos_L0+8 
	MOVLW       111
	MOVWF       main_digitos_L0+9 
;p3c.c,19 :: 		uds = 0;
	CLRF        _uds+0 
;p3c.c,20 :: 		dec = 0;
	CLRF        _dec+0 
;p3c.c,22 :: 		RBPU_bit = 0;
	BCF         RBPU_bit+0, BitPos(RBPU_bit+0) 
;p3c.c,23 :: 		TRISB.B0 = 1;
	BSF         TRISB+0, 0 
;p3c.c,24 :: 		TRISA = 0;
	CLRF        TRISA+0 
;p3c.c,25 :: 		TRISD = 0;
	CLRF        TRISD+0 
;p3c.c,26 :: 		PORTA = 1;
	MOVLW       1
	MOVWF       PORTA+0 
;p3c.c,27 :: 		PORTD = 0;
	CLRF        PORTD+0 
;p3c.c,29 :: 		INTCON2.INTEDG0 = 0;
	BCF         INTCON2+0, 6 
;p3c.c,30 :: 		INTCON.INT0IF = 0;
	BCF         INTCON+0, 1 
;p3c.c,31 :: 		INTCON.INT0IE = 1;
	BSF         INTCON+0, 4 
;p3c.c,32 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;p3c.c,34 :: 		while(1){
L_main2:
;p3c.c,35 :: 		PORTD = digitos[uds];
	MOVLW       main_digitos_L0+0
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(main_digitos_L0+0)
	MOVWF       FSR0L+1 
	MOVF        _uds+0, 0 
	ADDWF       FSR0L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0L+1, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;p3c.c,36 :: 		PORTA.B0 = 0;
	BCF         PORTA+0, 0 
;p3c.c,37 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	NOP
	NOP
;p3c.c,38 :: 		PORTA.B0 = 1;
	BSF         PORTA+0, 0 
;p3c.c,40 :: 		PORTD = digitos[dec];
	MOVLW       main_digitos_L0+0
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(main_digitos_L0+0)
	MOVWF       FSR0L+1 
	MOVF        _dec+0, 0 
	ADDWF       FSR0L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0L+1, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;p3c.c,41 :: 		PORTA.B1 = 0;
	BCF         PORTA+0, 1 
;p3c.c,42 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	NOP
	NOP
;p3c.c,43 :: 		PORTA.B1 = 1;
	BSF         PORTA+0, 1 
;p3c.c,45 :: 		}
	GOTO        L_main2
;p3c.c,47 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
