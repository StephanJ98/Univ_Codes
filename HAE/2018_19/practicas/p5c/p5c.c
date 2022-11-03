#include "Tecla12INT.h"

char num[4];
unsigned short simple = 0;
unsigned short cantidad = 0;
char x;

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
     simple++;
     if (simple == 2 || simple > 2){
        cantidad++;
        if (cantidad == 100){
           cantidad = 0;
        }
        simple = 0;
     }

     ByteToStr(cantidad, num);

     if (cantidad == 0) {
     Lcd_Out(1,1, "Turno: ");
     }
     
     Lcd_Out(1,9,num);

     x = PORTB; // para poder borrar el bit RBIF (define x global)
     INTCON.RBIF = 0; // se borra el bit RBIF despu�s de llamar a la funci�n tecla()

}

void main() {
     TRISB = 0xF0; // el nibble alto son entradas y el nibble bajo son salidas
     PORTB = 0;

     Lcd_Init();
     INTCON2.RBPU = 0; // se habilitan las resistencias de pullup del puerto B
     x = PORTB; //para poder borrar el RBIF
     INTCON.RBIF = 1;
     INTCON.RBIE = 1;
     INTCON.GIE = 1;
     

     while(1);
}