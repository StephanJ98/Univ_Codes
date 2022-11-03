/*Declaraciones*/
RESERVADA "auto"|"base"|"boolean"|"break"|"case"|"catch"|"class"|"char"|"continue"|"default"|"do"|"double"|"else"|"enum"|"extern"|"false"|"finally"|"float"|"for"|"goto"|"if"|"include"|"int"|"interface"|"long"|"namespacenew"|"override"|"private"|"protected"|"public"|"return"|"sealed"|"short"|"signed"|"sizeof"|"staticstruct"|"switch"|"this"|"throw"|"true"|"typedef"|"union"|"unsigned"|"using"|"virtual"|"void"|"while"
DELIMITADORES [?:;,(){}]
COMENTARIO "//".*\n
MULTILINEA "/*".*"*/"
OPERADOR_A "+"|"-"|"*"|"/"|"&"|"--"|"++"|"*="|"%="|"+="|"-="
OPERADOR_M  "."|"->"|"*"|"&"|"["|"]"
OPERADOR_B "~"|"&"|"|"|"^"|"<<"|">>"|"<<="|">>="|"&="|"^="|"|="
OPERADOR_R "<"|">"|"<="|">="|"=="|"!="
OPERADOR_L "!"|"&&"|"||"
CADENA \".*\"
IDENTIFICADOR [A-Za-z_][A-Za-z_0-9]
ESPACIO [[:blank:]]|\n
ENTERO  [[:digit:]]+|0[0-7]+|"0x"[0-9A-Fa-f]|"0X"[0-9A-Fa-f] 
REAL [0-9]*.[0-9]|"0X"[0-9A-Fa-f]*.[0-9A-Fa-f]|"0x"[0-9A-Fa-f]*.[0-9A-Fa-f]
MANTISA {ENTERO}[eE][+-]?{ENTERO}|{REAL}[eE][+-]?{REAL}
CARACTER \'[^'\n\\]\'|\'\'
%{
/*Declaraciones en C*/
	#include <stdio.h>
	int linea = 1;
%}
/*Reglas*/
%%








{ESPACIO}{CARACTER}{ESPACIO} printf("\nlinea %d, Caracter: ",linea);ECHO;
\n linea++;/*Cuando encuentra un /n cambia de linea*/
{ESPACIO}.+{ESPACIO} printf("\nlinea %d, Error: ",linea);ECHO;

%%
/*Código C*/
/*yywrap() Se ejecuta al llegar al final del fichero y devuelve 1 para indicar que no queda texto por procesar*/

int yywrap(){
	printf("\nAnálisis terminado");	
	return 1; 
} 

int main(char args[]) {
    yyin = fopen(args,"r");/*Abre el fichero pasado como argumento en modo lectura*/
/* yylex() toma caracteres de la entrada hasta que coinciden con una exp. reg*/
    while (yylex());
}
