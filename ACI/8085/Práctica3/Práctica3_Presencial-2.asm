// DIVISION
# ORG 0000H
# BEGIN 0000H
	   LXI H,FD00	// INICIALIZA PUNTERO HL
	   LXI B,FD01	// INICIALIZA PUNTERO BC
	   MVI E,00
	   LDA FC01	// N
	   MOV D,A
	   LDA FC00	// V
	   MOV M,A

BUCLE:	   MOV A,E
	   CMP D
	   JZ FIN

		// ALMACENA VALOR
	   MOV A,M
	   INR A
	   STAX B

	   INX H	//INCREMENTA PUNTEROS
	   INX B

	   INR E
	   JMP BUCLE

FIN:	   HLT
// V, N
// A[25]
# ORG FC00
# DB 01H,10D
# ORG FD00
# DB FFH,FFH
