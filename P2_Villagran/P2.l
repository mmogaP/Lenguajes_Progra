%{ 
  #include<stdio.h> 
  #include "bison.tab.h" 
  void yyerror(char *);
%}

%option noyywrap

EJEY [NS]
EJEX [EO]



/* Rule Section */
%% 

{EJEY} {yylval.strVal= strdup (yytext); return EJEY; }
{EJEX} {yylval.strVal= strdup (yytext); return EJEX; }
\n  {return FINLINEA;}
"evaluar"            { return EVALUAR; }
[[:blank:]] ;
.                     yyerror("Unknown character");

%%