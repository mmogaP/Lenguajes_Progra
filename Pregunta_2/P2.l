%{ 
  #include<stdio.h> 
  #include "P2.tab.h" 
  void yyerror(char *);
%} 

%option noyywrap

LETRA [NSEO]
secuencia {LETRA}+

/* Rule Section */
%% 

{secuencia} {yylval.strVal= strdup (yytext); return secuencia; }
"evaluar"            { return EVALUAR; }
[[:blank:]] ;
.                     yyerror("Unknown character");

%%