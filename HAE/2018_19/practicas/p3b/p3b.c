void interrupt(){
     PORTB.B1 = !PORTB.B1;
     INTCON.INT0IF = 0;
     
}

void main() {
     RBPU_bit = 0;
     TRISB.B0 = 1;
     TRISB.B1 = 0;
     PORTB.B1 = 0;
     
     INTCON2.INTEDG0 = 0;
     INTCON.INT0IF = 0;
     INTCON.INT0IE = 1;
     INTCON.GIE = 1;
     
     while(1);
     
}