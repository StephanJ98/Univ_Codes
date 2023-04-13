%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char*);
%}

%token INTEGER

%left '-' '+'
%left '*' 

%nonassoc UMINUS

%%

program: line program
         | line	
line:   '\n'
        | expr '\n'	   { printf("= %d\n", $1); }
expr:	expr '+' expr	   { $$ = $1 + $3; }
        | expr '-' expr      { $$ = $1 - $3; }
        | expr '*' expr      { $$ = $1 * $3; }
        | '-' expr %prec UMINUS  { $$ = - $2; }
        | '(' expr ')'       { $$ = $2; }
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

