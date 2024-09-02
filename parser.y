%{
#include <stdio.h>
void yyerror(const char *s);
int yylex(void);
%}
%token NUMBER
%%
expr: expr '+' expr   { printf("%d\n", $1 + $3); }
    | expr '-' expr   { printf("%d\n", $1 - $3); }
    | NUMBER          { $$ = $1; }
    ;
%%
void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
int main(void) {
    yyparse();
    return 0;
}
