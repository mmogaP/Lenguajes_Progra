%{ 
  #include<stdio.h> 
  #include "P3.tab.h" 
  void yyerror(char *);
%} 

%option noyywrap

/* Rule Section */
%% 

.                     yyerror("Unknown character");

%%