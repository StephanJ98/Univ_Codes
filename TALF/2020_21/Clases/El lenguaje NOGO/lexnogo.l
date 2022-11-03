%n 1000
%a 3500
%p 5500
%o 4000
%{
/*
This file is a sed script to be applied to the file defining the non
generic tokens.  It should define all the generic ones whose definition
can't be specified in METAL.  It could also define some macros and sizes
of LEX that may be needed.
*/
%}
%S entrypoint COMMENT
LOWERCASE     [a-z]
UPPERCASE     [A-Z]
DIGIT	      [0-9]
ALPHANUM      ({LOWERCASE}|{UPPERCASE}|{DIGIT}|_)
BLANK	      [ \t]
SPACE	      ({BLANK}|\n)
CHAR          "'".?"'"
IDENT	      (({LOWERCASE}|{UPPERCASE}){ALPHANUM}*)
NUM	      {DIGIT}(_?{DIGIT})*
STRING	      \"([^\"]|\"\")*\"
%%
"--"	      {BEGIN COMMENT;}
<COMMENT>[^\n]* ;
\n              ;
[ \t]           ;

";" return(KW_PVIR);
":" return(KW_DPIN);
":=" return(KW_DPINEQUL);
"(" return(KW_POUV);
")" return(KW_PFER);
".." return(KW_POINPOIN);
"," return(KW_VIRG);
"." return(KW_POIN);
"=" return(KW_EQUL);
"/=" return(KW_SLAHEQUL);
"<" return(KW_INFE);
"<=" return(KW_INFEEQUL);
">" return(KW_SUPE);
">=" return(KW_SUPEEQUL);
"+" return(KW_PLUS);
"-" return(KW_MINU);
"*" return(KW_ETOI);
"/" return(KW_SLAH);
"and" return(KW_and);
"AND" return(KW_AND);
"ARRAY" return(KW_ARRAY);
"array" return(KW_array);
"BEGIN" return(KW_BEGIN);
"begin" return(KW_begin);
"CONSTANT" return(KW_CONSTANT);
"constant" return(KW_constant);
"DECLARE" return(KW_DECLARE);
"declare" return(KW_declare);
"ELSE" return(KW_ELSE);
"else" return(KW_else);
"END" return(KW_END);
"end" return(KW_end);
"EXIT" return(KW_EXIT);
"exit" return(KW_exit);
"FOR" return(KW_FOR);
"for" return(KW_for);
"FUNCTION" return(KW_FUNCTION);
"function" return(KW_function);
"IF" return(KW_IF);
"if" return(KW_if);
"IN" return(KW_IN);
"in" return(KW_in);
"IS" return(KW_IS);
"is" return(KW_is);
"LOOP" return(KW_LOOP);
"loop" return(KW_loop);
"MOD" return(KW_MOD);
"mod" return(KW_mod);
"NOT" return(KW_NOT);
"not" return(KW_not);
"NULL" return(KW_NULL);
"null" return(KW_null);
"OF" return(KW_OF);
"of" return(KW_of);
"OR" return(KW_OR);
"or" return(KW_or);
"OUT" return(KW_OUT);
"out" return(KW_out);
"PROCEDURE" return(KW_PROCEDURE);
"procedure" return(KW_procedure);
"RECORD" return(KW_RECORD);
"record" return(KW_record);
"return" return(KW_return);
"REVERSE" return(KW_REVERSE);
"reverse" return(KW_reverse);
"RETURN" return(KW_RETURN);
"THEN" return(KW_THEN);
"then" return(KW_then);
"TYPE" return(KW_TYPE);
"type" return(KW_type);
"WHEN" return(KW_WHEN);
"when" return(KW_when);
"WHILE" return(KW_WHILE);
"while" return(KW_while);
<entrypoint>. {BEGIN 0; unput(yytext[0]);};
{IDENT}			return(IDENT);
{CHAR}                  return(CHAR);
{STRING}		return(STRING);
{NUM}			return(INTEGER);
.			return(yytext[0]);

