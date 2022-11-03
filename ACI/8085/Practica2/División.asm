// DIVISION
# ORG 0000H
# BEGIN 0000H
	   LDA F000	//DIVDO
	   MOV B,A
	   LDA F001	//DSOR

	   CPI 00
	   JZ FIN

	   MOV C,A
	   LDA F000	//RESTO
	   MOV D,A

	   MVI H,0H

BUCLE:	   MOV A,D
	   CMP C
	   JC FINAL

	   SUB C	
	   INR H	// Q++

	   JMP BUCLE

FINAL:	   MOV A,H
	   STA F100
	   MOV A,D
	   STA F101

FIN:	   HLT

# ORG F000
# DB 02H,03H
# ORG F100
# DB FFH,FFH
