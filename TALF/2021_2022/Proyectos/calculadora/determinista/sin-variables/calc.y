%{
#include <stdio.h>
#include <stdlib.h>
  void yyerror(char *);
%}

%token INTEGER

%%

program: line program
         | line	
line:   '\n'
        | expr '\n'	   { printf("= %d\n", $1); }
expr:	expr '+' term	   { $$ = $1 + $3; }
| term                     { $$ = $1; }
term:   term '*' factor    { $$ = $1 * $3; }
| factor                   { $$ = $1; }
factor: '(' expr ')'       { $$ = $2; }
        | INTEGER          { $$ = $1; }

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

