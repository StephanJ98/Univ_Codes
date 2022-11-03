/*
 *Diégo Stéphan Jeandon Rodríguez
 *Parte I proyecto HAE 2019
 *
*/
char presencia = 0;
char abierto = 0;
char cerrado = 1;
char swicher = 1;

void interrupt(){
		INTCON.TMR0IF = 0;// se borra el flag
		cerrado = PORTB.B0;
		abierto = PORTB.B1;
		presencia = PORTB.B2;
		if(swicher == 1){// Actualmente tiempo de trabajo = 0.1 s.
			if(cerrado == 1 && presencia == 0){//Puerta cerrada sin presencia , no hace nada.
				PORTC.B0 = 0;
				PORTC.B1 = 0;
			}else if(cerrado == 1 || abierto == 0 && presencia == 1){//Puerta cerrada o no completamente abierta con presencia , abre.
				PORTC.B0 = 1;
				PORTC.B1 = 0;
			}else if(abierto == 1 && presencia == 1){//Puerta abierta con presencia , no hace nada.
				PORTC.B0 = 0;
				PORTC.B1 = 0;
			}else if(abierto == 1 || cerrado == 0 && presencia == 0){//Puerta abierta o no completamente cerrada sin presencia , cierra.
				PORTC.B0 = 0;
				PORTC.B1 = 1;
			}else if(cerrado == 0 && presencia == 1){//Puerta no completamente cerrada con presencia , abre.
				PORTC.B0 = 1;
				PORTC.B1 = 0;
			}else{
				PORTC.B0 = 0;
				PORTC.B1 = 0;
			}
			swicher = 0;
			T0CON = 0x85;
			TMR0H = (15536 >> 8);
			TMR0L = 15536;
		}else{// Actualmente tiempo de descanso = 0.1 s.
			swicher = 1;
			T0CON = 0x85;
			TMR0H = (15536 >> 8);
			TMR0L = 15536;
		}
	}
	void main() {
		TRISC.B0 = 0;//Pin para el motor0 configurado en salida.
		TRISC.B1 = 0;//Pin para el motor1 configurado en salida.
		PORTC.B0 = 0;//Se inicializa a 0 para evitar errores.
		PORTC.B1 = 0;//Se inicializa a 0 para evitar errores.
		TRISB.B0 = 1;//Pin para saber si la puerta esta cerrada configurado en salida.
		TRISB.B1 = 1;//Pin para saber si la puerta esta abierta configurado en salida.
		TRISB.B2 = 1;//Pin para la presencia configurado en salida.
		T0CON = 0X85;
		INTCON.TMR0IF = 0;
		INTCON.TMR0IE = 1;
		TMR0H = (15536 >> 8);
		TMR0L = 15536;
		INTCON.GIE = 1;
		while(1);
	}