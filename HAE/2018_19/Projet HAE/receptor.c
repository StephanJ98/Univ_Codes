/*
*Diégo Stéphan Jeandon Rodríguez
*Parte II proyecto HAE Receptor
*/
char octalH;
char octalL;
char compteur = 0;
unsigned int aux=0;
char txt[14];
float alfa;

sbit LCD_RS at RB2_bit;
sbit LCD_EN at RB3_bit;
sbit LCD_D4 at RB4_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D7 at RB7_bit;
sbit LCD_RS_Direction at TRISB2_bit;
sbit LCD_EN_Direction at TRISB3_bit;
sbit LCD_D4_Direction at TRISB4_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D7_Direction at TRISB7_bit;

void interrupt(){
	if(PIR1.RCIF == 1){
		PIR1.RCIF = 0; // se borra el flag de la interrupción RCIE
		if (UART1_Data_Ready()){
			if(compteur == 0){
				octalL = UART1_Read(); //se guarda el valor del octal menos significativo.
				compteur = 1;
			}else if (compteur == 1){
				octalH = UART1_Read(); //se guarda el valor del octal más significativo.
				compteur = 0;
			}
		}
	}else if(PIR1.ADIF == 1){
		PIR1.ADIF = 0;
		aux = octalL;
		aux = aux + (octalH << 8);
		aux = aux * (5.0 / 1024.0) - 0.5;
		alfa = aux / 0.01;
		FloatToStr(alfa,txt);
		Lcd_Cmd(_LCD_CLEAR);
		LCD_out(1,1,txt);
		delay_ms(100);
		ADCON0.B2 = 1;
	}
}
void main(){
	PIR1.RCIF = 0; //se pone a cero el flag de la interrupción RCIE
	PIE1.RCIE = 1; // se habilita la interrupción RCIE
	PIR1.ADIF = 0;
 	PIE1.ADIE=1; 
	ADCON1=0xDE;
 	ADCON0=0x41;
 	LCD_init();
 	INTCON.PEIE=1;
 	INTCON.GIE=1;
 	ADCON0.B2 = 1;
	while(1);
}