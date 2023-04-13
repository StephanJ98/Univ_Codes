%{
#include <stdio.h>
#include <stdlib.h>
 double var[26];
 void yyerror(char*);
%}

%union { double dval; int ivar; }
%token <ivar> NAME 
%token <dval> DOUBLE
%type <dval> expr
%type <dval> term
%type <dval> factor

%%

program: line program
         | line	
line:   NAME '=' expr '\n' { var[$1] = $3; }
        | expr '\n'	   { printf("= %g\n", $1); }
expr:	expr '+' term	   { $$ = $1 + $3; }
| term                     { $$ = $1; }
term:   term '*' factor    { $$ = $1 * $3; }
| factor                   { $$ = $1; }
factor: '(' expr ')'       { $$ = $2; }
        | NAME             { $$ = var[$1]; }
        | DOUBLE           { $$ = $1; }

%%

void yyerror(char *s)
{ 

  fprintf(stderr, "%s\n",s);
  return;

}
int main (void) {
	return yyparse();
        return 0;
	}

