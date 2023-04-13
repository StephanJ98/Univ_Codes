%{
#include <stdio.h>
#include <stdlib.h>
 double var[26];
 void yyerror(char *);
%}

%union { double dval; int ivar; }

%token <ivar> NAME 
%token <dval> DOUBLE

%type <dval> expr

%left '-' '+'
%left '*' 

%nonassoc UMINUS

%%

program: line program
         | line	
line:   NAME '=' expr '\n'        { var[$1] = $3; }
        | expr '\n'	          { printf("= %g\n", $1); }
expr:   expr '+' expr	          { $$ = $1 + $3; }
        | expr '-' expr           { $$ = $1 - $3; }
        | expr '*' expr           { $$ = $1 * $3; }
        | '-' expr  %prec UMINUS  { $$ = - $2; }
        | '(' expr ')'            { $$ = $2; }
        | NAME                    { $$ = var[$1]; }
        | DOUBLE                  { $$ = $1; }

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

