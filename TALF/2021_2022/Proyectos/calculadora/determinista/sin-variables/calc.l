%{
#include "calc.tab.h"
#include<stdlib.h>
#include<stdio.h>
%}

%%
[0-9]+  { 
          yylval = atoi(yytext); 
	  return INTEGER; 
        }
[+*]	{ return *yytext; 
        }
"("     { return *yytext;
        }
")"     { return *yytext;
        }
\n	{ return *yytext;
        }
[ \t]+ ;
.	{ printf ("found other data \"%s\"\n", yytext);
	  return yytext[0]; 
        }
%%
