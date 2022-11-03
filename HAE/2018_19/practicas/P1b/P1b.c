char x = 1;
void main() {
     ADCON1 = 0x07;
     TRISC = 0;
     PORTC = 0;
     
     while (1) {
           PORTC = x;
           delay_ms(200);
           PORTC = 0;
           delay_ms(100);
           x = (x << 1);
           if (x == 0) {
              x = 1;
           }
     }
}