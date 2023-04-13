%{
#include "calc.tab.h"
#include<stdlib.h>
#include<stdio.h>
%}

%%
(([0-9]+(\.[0-9]*)?)|([0-9*\.[0-9]+))	{ 
          yylval.dval = atof(yytext); 
	  return DOUBLE; 
        }
[+*=-]	{ return *yytext; 
        }
"("     { return *yytext;
        }
")"     { return *yytext;
        }
[a-z]   { yylval.ivar = *yytext;
          return NAME; 
        }
\n	{ return *yytext;
        }
[ \t]+ ;
.	{ printf ("found other data \"%s\"\n", yytext);
	  return yytext[0]; 
        }
%%
