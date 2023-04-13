%{
/*
 * Example 2 Lexer
 */

#include "address.tab.h"

%}

%%

[\t ]+ 		/* ignore whitespace */;

[A-Z][a-z]+	 { return CAPSTRING; };

[A-Z][A-Z]	{return STATE; }

[A-Z] 		{return CAPLETTER; }

[0-9]+ 		{return NUMBER; }

[0-9][0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9] 	{return ZIPPLUSFOUR; }

\, 		{return COMMA; }

#		{return HASH; }

\. 		{return DOT; }

\n		{return NEWLINE; }

%%

#ifdef STANDALONE
void main( void ) {
   int token;

   token = yylex();
   while ( token > 0 ) {
      switch ( token ) {
         case CAPSTRING: printf("CapString\n"); break;
         case STATE: printf("State\n"); break;
         case CAPLETTER: printf("CapLetter\n"); break;
         case NUMBER: printf("Number\n"); break;
         case ZIPPLUSFOUR: printf("ZipPlusFour\n"); break;
         case COMMA: printf("Comma\n"); break;
         case HASH: printf("Hash\n"); break;
         case DOT: printf("Dot\n"); break;
         case NEWLINE: printf("Newline\n"); break;
         default: printf("Unknown\n");
      }
      token = yylex();
   }
}
#endif
