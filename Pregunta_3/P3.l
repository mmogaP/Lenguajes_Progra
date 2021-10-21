%{ 
  #include<stdio.h> 
  #include "P3.tab.h" 
  void yyerror(char *);
%}

%option noyywrap

EJEY [NS]
EJEX [EO]
"*"	{ return MULTIPLICA; }
[0-9]+	{ yylval = atoi(yytext); return NUMERO; }
/* Rule Section */
%% 
{EJEY} {yylval.strVal= strdup (yytext); return EJEY; }
{EJEX} {yylval.strVal= strdup (yytext); return EJEX; }
\n  {return FINLINEA;}

[[:blank:]] ;
.                     yyerror("Unknown character");

%%