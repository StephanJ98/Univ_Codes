
_main:

;p1c.c,1 :: 		void main() {
;p1c.c,2 :: 		char array[] = {0x81, 0x42, 0x24, 0x18, 0x24, 0x42};
	MOVLW       129
	MOVWF       main_array_L0+0 
	MOVLW       66
	MOVWF       main_array_L0+1 
	MOVLW       36
	MOVWF       main_array_L0+2 
	MOVLW       24
	MOVWF       main_array_L0+3 
	MOVLW       36
	MOVWF       main_array_L0+4 
	MOVLW       66
	MOVWF       main_array_L0+5 
;p1c.c,3 :: 		ADCON1 = 0x07;
	MOVLW       7
	MOVWF       ADCON1+0 
;p1c.c,4 :: 		TRISC = 0;
	CLRF        TRISC+0 
;p1c.c,5 :: 		PORTC = 0;
	CLRF        PORTC+0 
;p1c.c,7 :: 		while(1){
L_main0:
;p1c.c,8 :: 		char i = 0;
	CLRF        main_i_L1+0 
;p1c.c,9 :: 		for (i = 0; i<=5; i++){
	CLRF        main_i_L1+0 
L_main2:
	MOVF        main_i_L1+0, 0 
	SUBLW       5
	BTFSS       STATUS+0, 0 
	GOTO        L_main3
;p1c.c,10 :: 		PORTC = array[i];
	MOVLW       main_array_L0+0
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(main_array_L0+0)
	MOVWF       FSR0L+1 
	MOVF        main_i_L1+0, 0 
	ADDWF       FSR0L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0L+1, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTC+0 
;p1c.c,11 :: 		delay_ms(400);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	DECFSZ      R11, 1, 1
	BRA         L_main5
;p1c.c,12 :: 		PORTC = 0;
	CLRF        PORTC+0 
;p1c.c,13 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	DECFSZ      R11, 1, 1
	BRA         L_main6
;p1c.c,9 :: 		for (i = 0; i<=5; i++){
	INCF        main_i_L1+0, 1 
;p1c.c,14 :: 		}
	GOTO        L_main2
L_main3:
;p1c.c,15 :: 		}
	GOTO        L_main0
;p1c.c,16 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
