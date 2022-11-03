unsigned short activado = 0;
float tiempo_pulso = 0.0;
unsigned short x = 0;
char txt [14];

// Lcd pinout settings
sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;

// Pin direction
sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;

void interrupt(){

     if (activado == 0) {
          TMR0L = 0x00;
          TMR0H = 0x00;
          T0CON.B7 = 1;
          activado = 1;
     }
     else if (activado) {
          tiempo_pulso = TMR0L;
          tiempo_pulso += ( TMR0H << 8 );
          tiempo_pulso = tiempo_pulso*128e-6;
     
          FloatToStr(tiempo_pulso,txt);
          Lcd_Out(1,1,txt);
          INTCON.TMR0IE = 0;
     }
     x = PORTB;
     INTCON.RBIF = 0;
}

void main() {
     Lcd_Init();
     ADCON1 = 0x07;
     
     TRISB.B4 = 1;
     
     x = PORTB;
     INTCON.RBIF = 0;
     INTCON.RBIE = 1;
     
     T0CON = 0x07;
     INTCON.TMR0IF = 0;
     INTCON.TMR0IE = 1;
     INTCON.GIE = 1;
     
     while(1){
           asm nop;
     }
}