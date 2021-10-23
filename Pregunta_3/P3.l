%{ 
  #include<stdio.h> 
  #include "P3.tab.h" 
  void yyerror(char *);
%}

%option noyywrap
NUM [0-9]
EJEY [NS]
EJEX [EO]

/* Rule Section */
%% 
[0-9]+	{ yylval.c = atoi(yytext); return NUM; }
{EJEY} {yylval.strVal= strdup (yytext); return EJEY; }
{EJEX} {yylval.strVal= strdup (yytext); return EJEX; }
\n  {return FINLINEA;}

[[:blank:]] ;
.                     yyerror("Unknown character");

%%