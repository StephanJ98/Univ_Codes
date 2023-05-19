%{
	#include <string.h>
	#include <stdlib.h>
	#include "moronico.tab.h"
%}

%option yylineno

%x CADENA
%x COMENTARIO
%x COMENTARIOMULTILINEA

ESPACIO [ \t]
DECIMAL ([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])
OCTAL \\([0-7]|[1-7][0-7]|[1-3][0-7]{2})
HEXADECIMAL \\[xX][0-9a-fA-F]{1,2}
CARACTER ([^\n\\\'\"?]|\\[\'\"?\\abfnrtv]|{DECIMAL}|{HEXADECIMAL}|{OCTAL})
IDENTIFICADOR [A-Za-z_][A-Za-z_0-9]*

%%

({ESPACIO}|\n)+ ;

(?i:abstracto) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return ABSTRACTO;
}

(?i:asociativa) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return ASOCIATIVA;
}

(?i:booleano) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return BOOLEANO;
}

(?i:cabecera) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return CABECERA;
}

(?i:cadena) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return CADENA;
}

(?i:caso) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return CASO;
}

(?i:caracter) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return CARACTER;
}

(?i:clase) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return CLASE;
}

(?i:conjunto) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return CONJUNTO;
}

(?i:constante) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return CONSTANTE;
}

(?i:cuerpo) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return CUERPO;
}

(?i:constructor) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return CONSTRUCTOR;
}

(?i:cuando) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return CUANDO;
}

(?i:descendente) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return DESCENDENTE;
}

(?i:destructor) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return DESTRUCTOR;
}

(?i:de) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return DE;
}

(?i:devolver) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return DEVOLVER;
}

(?i:carga) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return CARGA;
}

(?i:elemento) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return ELEMENTO;
}

(?i:ejecuta) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return EJECUTA;
}

(?i:en) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return EN;
}

(?i:entero) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return ENTERO;
}

(?i:entonces) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return ENTONCES;
}

(?i:especifico) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return ESPECIFICO;
}

(?i:excepto) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return EXCEPTO;
}

(?i:fichero) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return FICHERO;
}

(?i:final) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return FINAL;
}

(?i:finalmente) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return FINALMENTE;
}

(?i:funcion) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return FUNCION;
}

(?i:generico) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return GENERICO;
}

(?i:hasta) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return HASTA;
}

(?i:interfaz) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return INTERFAZ;
}

(?i:lanzar) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return LANZAR;
}

(?i:lista) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return LISTA;
}

(?i:mientras) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return MIENTRAS;
}

(?i:modificable) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return MODIFICABLE;
}

(?i:otro) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return OTRO;
}

(?i:paquete) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return PAQUETE;
}

(?i:para) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return PARA;
}

(?i:privado) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return PRIVADO;
}

(?i:probar) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return PROBAR;
}

(?i:procedimiento) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return PROCEDIMIENTO;
}

(?i:programa) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return PROGRAMA;
}

(?i:publico) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return PUBLICO;
}

(?i:real) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return REAL;
}

(?i:registro) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return REGISTRO;
}

(?i:repite) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return REPITE;
}

(?i:salir) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return SALIR;
}

(?i:sea) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return SEA;
}

(?i:semipublico) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return SEMIPUBLICO;
}

(?i:si) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return SI;
}

(?i:sino) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return SINO;
}

(?i:tipo) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return TIPO;
}

(?i:variable) {
	printf("Linea: %d, palabra reservada: %s\n",yylineno,yytext);
	return VARIABLE;
}

{IDENTIFICADOR} {
	printf("Linea: %d, identificador: %s\n",yylineno,yytext);
	return IDENTIFICADOR;
}

[0-9]+ {
	printf("Linea: %d, constante entera: %s\n",yylineno,yytext);
	return CTC_ENTERA;
}
\\[0-7]+ {
	printf("Linea: %d, constante entera: %s\n",yylineno,yytext);
	return CTC_ENTERA;
}
\\[xX][0-9a-fA-F]+ {
	printf("Linea: %d, constante entera: %s\n",yylineno,yytext);
	return CTC_ENTERA;
}

[0-9]*'[0-9]+ {
	printf("Linea: %d, constante real: %s\n",yylineno,yytext);
	return CTC_REAL;
}

[0-9]*'?[0-9]+\^[+\-]?[0-9]+ {
	printf("Linea: %d, constante real: %s\n",yylineno,yytext);
	return CTC_REAL;
}

\'{CARACTER}\' {
	printf("Linea: %d, constante caracter: %s\n",yylineno,yytext);
	return CTC_CARACTER;
}

\"{CARACTER}* {
	printf("Linea: %d, constante cadena: %s",yylineno,yytext); BEGIN CADENA;
}

<CADENA>\\{ESPACIO}*(\/\/.*)?\n{ESPACIO}* ;
<CADENA>{CARACTER}+ 	printf("%s",  yytext); 
<CADENA>\" {
	printf("%s\n", yytext); BEGIN 0;
	return CTC_CADENA;
}

\"\.{0,2}\/[^\n\"]+\" {
	printf("Linea: %d, path: %s\n",yylineno,yytext);
	return PATH;
}  

("{"|"}"|"("|")"|":"|";"|","|"|") {
	printf("Linea: %d, delimitador: %s\n",yylineno,yytext);
	return yytext[0];
}

"::" {
	printf("Linea: %d, delimitador: %s\n",yylineno,yytext);
	return CUATRO_PTOS;
} 
".." {
	printf("Linea: %d, delimitador: %s\n",yylineno,yytext);
	return DOS_PTOS;
} 
"=>" {
	printf("Linea: %d, delimitador: %s\n",yylineno,yytext);
	return FLECHA_DOBLE;
}

("="|"+"|"-"|"*"|"/"|"%"|"."|"["|"]"|"@"|"~"|"&"|"<"|">"|"!") {
	printf("Linea: %d, operador: %s\n",yylineno,yytext);
	return yytext[0];
}

"=<" {
	printf("Linea: %d, operador: %s\n",yylineno,yytext);
	return LEQ;
}

">=" {
	printf("Linea: %d, operador: %s\n",yylineno,yytext);
	return GEQ;
} 
":=" {
	printf("Linea: %d, operador: %s\n",yylineno,yytext);
	return EQ;
} 
"!=" {
	printf("Linea: %d, operador: %s\n",yylineno,yytext);
	return NEQ;
} 
"<-" {
	printf("Linea: %d, operador: %s\n",yylineno,yytext);
	return DESPI;
} 
"->" {
	printf("Linea: %d, operador: %s\n",yylineno,yytext);
	return DESPD;
}

"**" {
	printf("Linea: %d, operador: %s\n",yylineno,yytext);
	return POTENCIA;
} 
"/\\" {
	printf("Linea: %d, operador: %s\n",yylineno,yytext);
	return AND;
} 
"\\/" {
	printf("Linea: %d, operador: %s\n",yylineno,yytext);
	return OR;
}

"/*" BEGIN COMENTARIOMULTILINEA;
<COMENTARIOMULTILINEA>. ;
<COMENTARIOMULTILINEA>\n ; 
<COMENTARIOMULTILINEA>"*/" BEGIN 0;

\/\/ BEGIN COMENTARIO;
<COMENTARIO>. ;
<COMENTARIO>\n BEGIN 0;

. {
	printf("Linea: %d, ERROR\n", yylineno);
}

%%