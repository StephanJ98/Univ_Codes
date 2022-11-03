unsigned short seg = 0;
void interrupt() {
     if (INTCON3.INT1IF == 1 && INTCON3.INT1IE == 1) {
        PORTC.B0 = 1;
        T0CON = 0x84;
        TMR0H = (3036>>8);
        TMR0L = 3036;
        INTCON3.INT1IF = 0;
        INTCON3.INT1IE = 0;
     }
     if (INTCON.TMR0IF && INTCON.TMR0IE) {
        INTCON.TMR0IF = 0;
        seg++;
        if (seg < 3){
              TMR0H = (3036>>8);
              TMR0L = 3036;

        } else {
        PORTC.B0 = 0;
        INTCON3.INT1IF = 0;
        INTCON3.INT1IE = 1;
        }
     }
}
void main() {
     TRISB.B1 = 1;
     TRISC.B0 = 0;
     PORTC.B0 = 0;
     INTCON2.INTEDG1 = 1;
     INTCON3.INT1IF = 0;
     INTCON3.INT1IE = 1;
     INTCON.TMR0IF = 0;
     INTCON.TMR0IE = 1;
     INTCON.GIE = 1;

     while(1);
}