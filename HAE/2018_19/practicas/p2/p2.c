void main() {
     char arrayNum[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F};
     char uds = 0, i=0;
     char dec = 0;
     
     ADCON1 = 0x07;
     TRISD = 0;
     PORTD = 0;
     TRISA = 0;
     PORTA = 3;
     
     while (1){
           for (i = 0; i<=25; i++){
               PORTD = arrayNum[uds];
               PORTA.B0 = 0;
               delay_ms(20);
               PORTA.B0 = 1;
               
               PORTD = arrayNum[dec];
               PORTA.B1 = 0;
               delay_ms(20);
               PORTA.B1 = 1;
           }
           uds++;
           if (uds == 10){
              dec ++;
              uds = 0;
           }
           if (dec == 6){
              dec = 0;
           }
     }
}