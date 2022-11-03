#line 1 "D:/Escritorio/HAE Archivos practicas 19-20/Jueves de 9 a 11/p1c/p1c.c"
void main() {
 char array[] = {0x81, 0x42, 0x24, 0x18, 0x24, 0x42};
 ADCON1 = 0x07;
 TRISC = 0;
 PORTC = 0;

 while(1){
 char i = 0;
 for (i = 0; i<=5; i++){
 PORTC = array[i];
 delay_ms(400);
 PORTC = 0;
 delay_ms(200);
 }
 }
}
