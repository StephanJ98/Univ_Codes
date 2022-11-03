/*
*Diégo Stéphan Jeandon Rodríguez
*Parte II proyecto HAE Emisor
*/
float vTemp = 0.0;
void interrupt(){
		INTCON.TMR0IF = 0;// se borra el flag
		vTemp = PORTA.B0;
		if(swicher == 1){// El trabajo se realiza en cliclos alternos de 1 s.
			// Actualmente tiempo de trabajo = 1 s.
			while(UARTx_Tx_Idle() == 0);
				UART1_Writet(vTemp); //se envía el byte menos significativo de vTemp
			while(UARTx_Tx_Idle() == 0){
				delay_ms(10);
				UART1_Write(vTemp >> 8); //se envía el byte más significativo de vTemp
			}
			swicher = 0;
			T0CON = 0x85;
			TMR0H = (3036 >> 8);
			TMR0L = 3036;
		}else{// Actualmente tiempo de descanso = 1 s.
			swicher = 1;
			T0CON = 0x85;
			TMR0H = (3036 >> 8);
			TMR0L = 3036;
		}
	}
	void main() {
		TRISA.B0 = 1;//Pin para la lectura configurado en entrado.
		T0CON = 0X85;
		UART0.Init(9600);
		delay_ms(500);
		INTCON.TMR0IF = 0;
		INTCON.TMR0IE = 1;
		TMR0H = (3036 >> 8);
		TMR0L = 3036;
		INTCON.GIE = 1;
		while(1);
	}