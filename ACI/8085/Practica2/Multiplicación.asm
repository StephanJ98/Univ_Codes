// 8 BIT MULTIPLICATION
# ORG 0000H
# BEGIN 0000H
	   LDA F000
	   MOV B,A	// N1 <-(F002)
	   LDA F001
	   MOV D,A	// N2 <- (F001)

	   MVI C,00
	   MVI H,00

BUCLE:	   MOV A,C
	   CMP B
	   JZ FINAL

	   MOV A,H	// R+N2
	   ADD D
	   MOV H,A


	   INR C	// i++

	   JMP BUCLE

FINAL:	   MOV A,H
	   STA F100
	   HLT
// N1, N2
// R
# ORG F000
# DB 02H,05H
# ORG F100
# DB FFH
