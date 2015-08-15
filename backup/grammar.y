  /* erzeugt Samstag, 04. Juli 2015 14:18 (C) 2015 von Leander Jedamus*/
  /* modifiziert Samstag, 04. Juli 2015 14:21 von Leander Jedamus */

%token INTEGER VARIABLE
%left '+' '-'
%left '*' '/'

%{
    #include <stdio.h>
    void yyerror(char *);
    int yylex(void);
    int sym[26];
%}

%%

program:
         program statement '\n'
         |
	 ;
statement:
        expr		    { printf("%d\n", $1); }
	| VARIABLE '=' expr { sym[$1] = $3; }
	;
expr:
	INTEGER
	| VARIABLE	    { $$ = sym[$1]; }
	| expr '+' expr	    { $$ = $1 + $3; }
	| expr '-' expr	    { $$ = $1 - $3; }
	| expr '*' expr	    { $$ = $1 * $3; }
	| expr '/' expr	    { $$ = $1 / $3; }
        | '(' expr ')'	    { $$ = $2; }
	;

%%

void yyerror(char *s) {
  fprintf(stderr, "%s\n", s);
}

int main(void) {
  yyparse();
  return 0;
}

  /* vim:ai sw=2 */
