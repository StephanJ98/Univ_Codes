%{

/*
 * Example 4 - another broken yacc grammar, fixed.
 */

#include <stdio.h>

%}

%token A B C

%%

s: a
 | b
 ;

a: A
 | A a
 | C a
 ;

b: B
 ;

%%

int main (void) {
	return yyparse();
	}

/* Added because panther doesn't have liby.a installed. */
int yyerror (char *msg) {
	return fprintf (stderr, "BISON: %s\n", msg);
	}
