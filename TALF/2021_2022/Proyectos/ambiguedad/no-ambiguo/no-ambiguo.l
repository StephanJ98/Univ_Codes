%{

/*
 * Example 4 (fixed) Lexer.
 */

#include "no-ambiguo.tab.h"

%}

%%

[\t ]+		/* ignore */ ;

a |
A		{ return A; }

b |
B		{ return B; }

c |
C		{ return C; }

%%
