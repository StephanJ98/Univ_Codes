#include "Tecla12INT.h"

char key;
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
     key = tecla(); // en la variable key se guarda el valor ASCII de la tecla pulsada
     
     Lcd_Chr(1,1,key);
     
     x = PORTB; // para poder borrar el bit RBIF (define x global)
     INTCON.RBIF = 0; // se borra el bit RBIF después de llamar a la función tecla() 
     
}

void main() {
     TRISB = 0xF0; // el nibble alto son entradas y el nibble bajo son salidas 
     PORTB = 0;
     
     INTCON2.RBPU = 0; // se habilitan las resistencias de pullup del puerto B 
     x = PORTB; //para poder borrar el RBIF 
     INTCON.RBIF = 0;
     INTCON.RBIE = 1;
     INTCON.GIE = 1;

     Lcd_Init();
     
     while(1);

}