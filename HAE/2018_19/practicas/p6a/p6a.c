void interrupt() {
     if(PORTC.B0 == 1){
     PORTC.B0 = 0;
     T0CON = 0xC2;
     TMR0L = 81;
     } else {
     PORTC.B0 = 1;
     T0CON = 0xC1;
     TMR0L = 106;
     }
     INTCON.TMR0IF = 0;
}
void main() {
     TRISC.B0 = 0;
     PORTC.B0 = 1;
     T0CON = 0xC1;
     INTCON.TMR0IF = 0;
     INTCON.TMR0IE = 1;
     INTCON.GIE = 1;
     TMR0L = 106;


     while(1);
}