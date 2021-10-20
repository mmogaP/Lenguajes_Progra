%{ 
  #include<stdio.h> 
  #include "P2.tab.h" 
  void yyerror(char *);
%} 

%option noyywrap

LETRA [NSEO]
PALABRA {LETRA}+

/* Rule Section */
%% 

{PALABRA} {yylval.strVal= strdup (yytext); return PALABRA; }
"evaluar"            { return EVALUAR; }
[[:blank:]] ;
.                     yyerror("Unknown character");

%%