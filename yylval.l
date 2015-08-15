/* erzeugt Samstag, 04. Juli 2015 14:12 (C) 2015 von Leander Jedamus*/
/* modifiziert Samstag, 04. Juli 2015 14:15 von Leander Jedamus */

%{
  void yyerror(char *);
  #include "grammar.tab.h"
%}

%%

  /* variables */
[a-z]		{
		  yylval = *yytext - 'a';
		  return VARIABLE;
                }

  /* integers */
[0-9]+		{
		  yylval = atoi(yytext);
		  return INTEGER;
		}

  /* operators */
[-+()=/*\n]	{ return *yytext; }

  /* skip whitespace */
[ \t]		;

  /* anything else is an error */
.		yyerror("invalid character");

%%

int yywrap(void) {
  return 1;
}

/* vim:ai sw=2 */
