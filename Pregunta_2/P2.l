%{ 
  #include<stdio.h> 
  #include "P2.tab.h" 
  void yyerror(char *);
%} 

%option noyywrap

LETRA [NSEO]
PALABRA {LETRA}+

EJEY [NS]
EJEX [EO]
CADENA ({EJEY}{EJEX}|{EJEX}{EJEY}|{LETRA}+)

/* Rule Section */
%% 

{CADENA} {yylval.strVal= strdup (yytext); return CADENA; }
"evaluar"            { return EVALUAR; }
[[:blank:]] ;
.                     yyerror("Unknown character");

%%