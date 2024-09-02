%{
#include "y.tab.h"
void yyerror();
int yylex();
%}

%%
[0-9]+  {yylval.num = atoi(yytext);return (DIGIT);}
[+-;]   {return (yytext[0]);}
.       {printf("Unexpected Character : %s",yytext);}
%%

int yywrap(void){
    return 1;
}
