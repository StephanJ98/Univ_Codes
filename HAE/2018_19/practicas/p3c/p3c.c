char uds;
char dec;

void interrupt(){
     uds++;
     if (uds == 10){
        uds = 0;
        dec++;
     }
     if (dec == 10){
        dec = 0;
     }

     INTCON.INT0IF = 0;
}

void main() {
     char digitos[] = {63, 6, 91, 79, 102, 109, 125, 7, 127, 111};
     uds = 0;
     dec = 0;
     
     RBPU_bit = 0;
     TRISB.B0 = 1;
     TRISA = 0;
     TRISD = 0;
     PORTA = 1;
     PORTD = 0;

     INTCON2.INTEDG0 = 0;
     INTCON.INT0IF = 0;
     INTCON.INT0IE = 1;
     INTCON.GIE = 1;

     while(1){
              PORTD = digitos[uds];
              PORTA.B0 = 0;
              delay_ms(20);
              PORTA.B0 = 1;
              
              PORTD = digitos[dec];
              PORTA.B1 = 0;
              delay_ms(20);
              PORTA.B1 = 1;
              
     }

}