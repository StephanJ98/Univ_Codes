%{
/*
 * Example 2 - Yacc
 *
 * Recognize a street address of the type
 * 
 * John Doe
 * 1234 First Street
 * San Diego CA, 98765-4321
 */

#include <stdio.h>
%}

%token CAPSTRING CAPLETTER NUMBER STATE ZIPPLUSFOUR COMMA HASH DOT NEWLINE

%%

sentence: firstline secondline thirdline { printf("Have a valid address.\n"); }
        ;

firstline: firstname surname NEWLINE
         | firstname middlename surname NEWLINE
         ;

secondline: NUMBER street NEWLINE
          | NUMBER street HASH NUMBER NEWLINE
          ;

thirdline: city STATE COMMA zip NEWLINE
         ;

firstname: CAPSTRING ;

middlename: CAPLETTER DOT ;

surname: CAPSTRING ; 

street: CAPSTRING
       | CAPSTRING street
       ;

city: CAPSTRING
    | CAPSTRING city
    ;

zip: ZIPPLUSFOUR
   ;

%%

int main (void) {
	return yyparse();
	}


/* Added because panther doesn't have liby.a installed. */
int yyerror (char *msg) {
	return fprintf (stderr, "BISON: %s\n", msg);
	}


