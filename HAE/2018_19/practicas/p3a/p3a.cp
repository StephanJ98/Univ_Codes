#line 1 "D:/Escritorio/HAE Archivos practicas 19-20/Jueves de 9 a 11/p3a/p3a.c"
void main() {
 char aux = 0;
 RBPU_bit = 0;

 TRISB.B0 = 1;
 TRISB.B1 = 0;

 PORTB.B1 = 0;


 while(1){
 if (PORTB.B0 == 0 && aux == 1){
 PORTB.B1 = !PORTB.B1;
 }
 aux = PORTB.B0;
 delay_ms(100);

 }
}
