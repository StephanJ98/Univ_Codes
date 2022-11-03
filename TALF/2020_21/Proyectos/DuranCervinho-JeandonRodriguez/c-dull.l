%{
    #include <stdio.h>
    #include "c-dull.tab.h"
    int numero_linea = 1;
%}

IDENTIFICADOR [A-Za-z_]+[A-Za-z0-9_]*
ENTERO [0-9]+
REAL ([0-9]*\.[0-9]+)|([0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?)
CARACTERSIMPLE [^\n'\\]{1}
CARACTERESCAPADO \\'|\\\?|\\\\|\\a|\\b|\\f|\\n|\\r|\\t|\\v
CARACTERDECIMAL ([0-9]|([0-9]{2})|([0-1][0-9]{2})|2[0-4][0-9]|25[0-5])
CARACTEROCTAL \\([0-7]|([0-7]{2})|([0-3][0-7]{2}))
CARACTERHEXADECIMAL \\x[0-9A-Fa-f]{1,2}
CADENA  {CARACTERSIMPLE}|{CARACTERESCAPADO}|{CARACTERDECIMAL}|{CARACTEROCTAL}|{CARACTERHEXADECIMAL}|\\\n
PATH \"("\."|("\.\."))?"/"([^"\n]+"/")*[^"\n]+\"
SP [ \t]
 
%%
\n    numero_linea++;       
(?i:ABSTRACT)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext); return(ABSTRACT);}
(?i:AS)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(AS);}
(?i:AUTO)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(AUTO);}
(?i:BOOL)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(BOOLEAN);}
(?i:CASE)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(CASE);}
(?i:CATCH)	    {printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(CATCH);}
(?i:CONTINUE)		{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(CONTINUE);}
(?i:CHAR)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(CHAR);}
(?i:CONTS)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(CONST);}
(?i:DEFAULT)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(DEFAULT);}
(?i:DO)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(DO);}
(?i:DOUBLE)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(DOUBLE);}
(?i:ELSE)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(ELSE);}
(?i:ENUM)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(ENUM);}
(?i:EXTERN)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(EXTERN);}
(?i:FINALLY)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(FINALLY);}
(?i:FLOAT)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(FLOAT);}
(?i:FOR)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(FOR);}
(?i:GOTO)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(GOTO);}
(?i:IF)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(IF);}
(?i:INCLUDE)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(INCLUDE);}
(?i:INT)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(INT);}
(?i:INTERFACE)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(INTERFACE);}
(?i:LONG)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(LONG);}
(?i:NAMESPACE)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(NAMESPACE);}
(?i:NEW)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(NEW);}
(?i:OVERRIDE)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(OVERRIDE);}
(?i:PRIVATE)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(PRIVATE);}
(?i:PROTECTED)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(PROTECTED);}
(?i:PUBLIC)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(PUBLIC);}
(?i:RETURN)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(RETURN);}
(?i:SEALED)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(SEALED);}
(?i:SHORT)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(SHORT);}
(?i:SIGNED)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(SIGNED);}
(?i:SIZEOF)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(SIZEOF);}
(?i:STATIC)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(STATIC);}
(?i:STRUCT)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(STRUCT);}
(?i:SWITCH)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(SWITCH);}
(?i:THIS)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(THIS);}
(?i:THROW)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(THROW);}
"true"     {printf("Linea %d, constante booleana \n",numero_linea);return (BOOLEAN);}  
"false"         {printf("Linea %d, constante booleana \n",numero_linea);return (BOOLEAN);}
(?i:TYPEDEF)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(TYPEDEF);}
(?i:UNION)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(UNION);}
(?i:UNSIGNED)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(UNSIGNED);}
(?i:USING)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(USING);}
(?i:VIRTUAL)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(VIRTUAL);}
(?i:VOID)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(VOID);}
(?i:VOLATILE)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(VOLATILE);}
(?i:WHILE)	{printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(WHILE);}
{IDENTIFICADOR} {printf("Linea %d, IDENTIFICADOR: %s \n",numero_linea,yytext);return (IDENTIFICADOR);}                  
{ENTERO}        {printf("Linea %d, ENTERO: %s \n",numero_linea,yytext);return (CTC_ENTERA);}
{REAL}          {printf("Linea %d, REAL: %s \n",numero_linea,yytext);return (CTC_REAL);}
'{CADENA}*'     {printf("Linea %d, CONSTANTE CADENA: %s \n",numero_linea,yytext);return (CTC_CADENA);}
{PATH}          {printf("Linea %d, PATH: %s \n",numero_linea,yytext);return (PATH);}

(?i:CARGA)          {printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(CARGA);}
(?i:CABECERA)   {printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(CABECERA);}
(?i:CLASE)      {printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(CLASE);}
(?i:CONJUNTO)   {printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(CONJUNTO);}
(?i:CUERPO) {printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(CUERPO);}
(?i:CONSTRUCTOR)    {printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(CONSTRUCTOR);}
(?i:DESCENDENTE)    {printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(DESCENDENTE);}
(?i:DESTRUCTOR) {printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(DESTRUCTOR);}
(?i:DE)     {printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(DE);}
(?i:DEVOLVER)   {printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(DEVOLVER);}
(?i:ELEMENTO)   {printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(ELEMENTO);}
(?i:EN)     {printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(EN);}
(?i:ES)     {printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(ES);}
(?i:ESPECIFICO) {printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(ESPECIFICO);}
(?i:EXCEPTO)    {printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(EXCEPTO);}
(?i:FICHERO)    {printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(FICHERO);}
(?i:FINAL)      {printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(FINAL);}
(?i:FUNCION)    {printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(FUNCION);}
(?i:GENERICO)   {printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(GENERICO);}
(?i:HASTA)      {printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(HASTA);}
(?i:LISTA)      {printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(LISTA);}
(?i:MODIFICABLE)    {printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(MODIFICABLE);}
(?i:OTRO)       {printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(OTRO);}
(?i:PAQUETE)    {printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(PAQUETE);}
(?i:PARA)   {printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(PARA);}
(?i:PROCEDIMIENTO)  {printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(PROCEDIMIENTO);}
(?i:PROGRAMA)   {printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(PROGRAMA);}
(?i:REGISTRO)   {printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(REGISTRO);}
(?i:SALIR)      {printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(SALIR);}
(?i:SEMIPUBLICO)    {printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(SEMIPUBLICO);}
(?i:SI)     {printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(SI);}
(?i:SINO)       {printf("Linea %d, palabra reservada: %s \n",numero_linea,yytext);return(SINO);}
(?i:VARIABLE)   {printf("Linea %d, palabra reservada: %s\n",numero_linea,yytext);return(VARIABLE);}


\{      {printf("Linea %d, delimitador: %s \n",numero_linea,yytext);return(yytext[0]);}   
\}      {printf("Linea %d, delimitador: %s \n",numero_linea,yytext);return(yytext[0]);}
\(      {printf("Linea %d, delimitador: %s \n",numero_linea,yytext);return(yytext[0]);}
\)      {printf("Linea %d, delimitador: %s \n",numero_linea,yytext);return(yytext[0]);}
":"     {printf("Linea %d, delimitador: %s \n",numero_linea,yytext);return(yytext[0]);}
";"     {printf("Linea %d, delimitador: %s \n",numero_linea,yytext);return(yytext[0]);}
","     {printf("Linea %d, delimitador: %s \n",numero_linea,yytext);return(yytext[0]);}
"|"     {printf("Linea %d, delimitador: %s \n",numero_linea,yytext);return(yytext[0]);}
"=>"    {printf("Linea %d, delimitador: %s \n",numero_linea,yytext);return(FLECHA_DOBLE);}
".."    {printf("Linea %d, delimitador %s \n",numero_linea,yytext);return(DOS_PTOS);}
"::"    {printf("Linea %d, delimitador: %s \n",numero_linea,yytext);return(CUATRO_PTOS);}
"/\\"   {printf("Linea %d, operador: %s \n",numero_linea,yytext);return (AND);}
"\\/"   {printf("Linea %d, operador: %s \n",numero_linea,yytext);return(OR);}
"->"    {printf("Linea %d, operador: %s \n",numero_linea,yytext);return(PTR_ACCESO);}
"<-"    {printf("Linea %d, operador: %s \n",numero_linea,yytext);return(yytext[0]);}
":="    {printf("Linea %d, operador: %s \n",numero_linea,yytext);return(EQ);}
">="    {printf("Linea %d, operador: %s \n",numero_linea,yytext);return(GEQ);}
"=<"    {printf("Linea %d, operador: %s \n",numero_linea,yytext);return(LEQ);}
"!="    {printf("Linea %d, operador: %s \n",numero_linea,yytext);return(NEQ);}
"**"    {printf("Linea %d, operador: %s \n",numero_linea,yytext);return(POTENCIA);}
"="     {printf("Linea %d, operador: %s \n",numero_linea,yytext);return(yytext[0]);}
"+"     {printf("Linea %d, operador : %s \n",numero_linea,yytext);return(yytext[0]);}
"-"     {printf("Linea %d, operador : %s \n",numero_linea,yytext);return(yytext[0]);}
"*"     {printf("Linea %d, operador : %s \n",numero_linea,yytext);return(yytext[0]);}
"/"     {printf("Linea %d, operador : %s \n",numero_linea,yytext);return(yytext[0]);}
"%"     {printf("Linea %d, operador : %s \n",numero_linea,yytext);return(yytext[0]);}
"."     {printf("Linea %d, operador : %s \n",numero_linea,yytext);return(yytext[0]);}
"^"     {printf("Linea %d, operador : %s \n",numero_linea,yytext);return(yytext[0]);}
"@"     {printf("Linea %d, operador : %s \n",numero_linea,yytext);return(yytext[0]);}
"&"     {printf("Linea %d, operador : %s \n",numero_linea,yytext);return(yytext[0]);}
"<"     {printf("Linea %d, operador : %s \n",numero_linea,yytext);return(yytext[0]);}
">"     {printf("Linea %d, operador : %s \n",numero_linea,yytext);return(yytext[0]);}
"!"     {printf("Linea %d, operador : %s \n",numero_linea,yytext);return(yytext[0]);}
"+="	{printf("Linea %d, operador : %s \n",numero_linea,yytext);return(SUMA_ASIG);}
"<<="	{printf("Linea %d, operador : %s \n",numero_linea,yytext);return(DESPI_ASIG);}
"&&"	{printf("Linea %d, operador : %s \n",numero_linea,yytext);return(AND);}
"++"	{printf("Linea %d, operador : %s \n",numero_linea,yytext);return(INC);}
"-="	{printf("Linea %d, operador : %s \n",numero_linea,yytext);return(RESTA_ASIG);}
">>="	{printf("Linea %d, operador : %s \n",numero_linea,yytext);return(DESPD_ASIG);}
"--"	{printf("Linea %d, operador : %s \n",numero_linea,yytext);return(DEC);}
"<="	{printf("Linea %d, operador : %s \n",numero_linea,yytext);return(LE);}
"||"	{printf("Linea %d, operador : %s \n",numero_linea,yytext);return(OR);}
"*="	{printf("Linea %d, operador : %s \n",numero_linea,yytext);return(MULTI_ASIG);}
"&="	{printf("Linea %d, operador : %s \n",numero_linea,yytext);return(AND_ASIG);}
"<<"	{printf("Linea %d, operador : %s \n",numero_linea,yytext);return(DESPI);}
">>"	{printf("Linea %d, operador : %s \n",numero_linea,yytext);return(DESPD);}
"=="	{printf("Linea %d, operador : %s \n",numero_linea,yytext);return(EQ);}
"/="	{printf("Linea %d, operador : %s \n",numero_linea,yytext);return(DIV_ASIG);}
"|="	{printf("Linea %d, operador : %s \n",numero_linea,yytext);return(OR_ASIG);}
"%="	{printf("Linea %d, operador : %s \n",numero_linea,yytext);return(MOD_ASIG);}
"^="	{printf("Linea %d, operador : %s \n",numero_linea,yytext);return(XOR_ASIG);}
"/*"    { register int c; 
                for( ; ; ){
                    while((c = input()) != '*' && c != EOF){
                        ;
                        if(c == '\n')
                        {
                            numero_linea++;
                        }
                    }
                    if(c == '*')
                    {
                        while((c = input()) == '*')
                           ;
                           if(c=='/'){
                          
                            break;
                            }
                    }
                    if(c==EOF)
                    {                  
                        break;
                    }
                }
            }                
{SP}*[/]{2}.*\n  {numero_linea++;}
{SP} ;
.   {printf("Linea %d error\n",numero_linea);}
%%