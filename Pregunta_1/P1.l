%{ 
  #include<stdio.h> 
  #include "P1.tab.h" 
  void yyerror(char *);
%} 

%option noyywrap

/* expresiones regulares */
LETRA [NSEO]
PALABRA {LETRA}+


/* Rule Section */
%% 

{PALABRA} {yylval.strVal= strdup (yytext); return PALABRA; }
"evaluar"            { return EVALUAR; }
[[:blank:]] ;
.                     yyerror("Unknown character");

%%