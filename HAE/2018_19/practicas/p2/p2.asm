
_main:

;p2.c,1 :: 		void main() {
;p2.c,2 :: 		char arrayNum[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F};
	MOVLW       63
	MOVWF       main_arrayNum_L0+0 
	MOVLW       6
	MOVWF       main_arrayNum_L0+1 
	MOVLW       91
	MOVWF       main_arrayNum_L0+2 
	MOVLW       79
	MOVWF       main_arrayNum_L0+3 
	MOVLW       102
	MOVWF       main_arrayNum_L0+4 
	MOVLW       109
	MOVWF       main_arrayNum_L0+5 
	MOVLW       125
	MOVWF       main_arrayNum_L0+6 
	MOVLW       7
	MOVWF       main_arrayNum_L0+7 
	MOVLW       127
	MOVWF       main_arrayNum_L0+8 
	MOVLW       111
	MOVWF       main_arrayNum_L0+9 
	CLRF        main_uds_L0+0 
	CLRF        main_i_L0+0 
	CLRF        main_dec_L0+0 
;p2.c,6 :: 		ADCON1 = 0x07;
	MOVLW       7
	MOVWF       ADCON1+0 
;p2.c,7 :: 		TRISD = 0;
	CLRF        TRISD+0 
;p2.c,8 :: 		PORTD = 0;
	CLRF        PORTD+0 
;p2.c,9 :: 		TRISA = 0;
	CLRF        TRISA+0 
;p2.c,10 :: 		PORTA = 3;
	MOVLW       3
	MOVWF       PORTA+0 
;p2.c,12 :: 		while (1){
L_main0:
;p2.c,13 :: 		for (i = 0; i<=25; i++){
	CLRF        main_i_L0+0 
L_main2:
	MOVF        main_i_L0+0, 0 
	SUBLW       25
	BTFSS       STATUS+0, 0 
	GOTO        L_main3
;p2.c,14 :: 		PORTD = arrayNum[uds];
	MOVLW       main_arrayNum_L0+0
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(main_arrayNum_L0+0)
	MOVWF       FSR0L+1 
	MOVF        main_uds_L0+0, 0 
	ADDWF       FSR0L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0L+1, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;p2.c,15 :: 		PORTA.B0 = 0;
	BCF         PORTA+0, 0 
;p2.c,16 :: 		delay_ms(20);
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
;p2.c,17 :: 		PORTA.B0 = 1;
	BSF         PORTA+0, 0 
;p2.c,19 :: 		PORTD = arrayNum[dec];
	MOVLW       main_arrayNum_L0+0
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(main_arrayNum_L0+0)
	MOVWF       FSR0L+1 
	MOVF        main_dec_L0+0, 0 
	ADDWF       FSR0L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0L+1, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;p2.c,20 :: 		PORTA.B1 = 0;
	BCF         PORTA+0, 1 
;p2.c,21 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	NOP
	NOP
;p2.c,22 :: 		PORTA.B1 = 1;
	BSF         PORTA+0, 1 
;p2.c,13 :: 		for (i = 0; i<=25; i++){
	INCF        main_i_L0+0, 1 
;p2.c,23 :: 		}
	GOTO        L_main2
L_main3:
;p2.c,24 :: 		uds++;
	INCF        main_uds_L0+0, 1 
;p2.c,25 :: 		if (uds == 10){
	MOVF        main_uds_L0+0, 0 
	XORLW       10
	BTFSS       STATUS+0, 2 
	GOTO        L_main7
;p2.c,26 :: 		dec ++;
	INCF        main_dec_L0+0, 1 
;p2.c,27 :: 		uds = 0;
	CLRF        main_uds_L0+0 
;p2.c,28 :: 		}
L_main7:
;p2.c,29 :: 		if (dec == 6){
	MOVF        main_dec_L0+0, 0 
	XORLW       6
	BTFSS       STATUS+0, 2 
	GOTO        L_main8
;p2.c,30 :: 		dec = 0;
	CLRF        main_dec_L0+0 
;p2.c,31 :: 		}
L_main8:
;p2.c,32 :: 		}
	GOTO        L_main0
;p2.c,33 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
