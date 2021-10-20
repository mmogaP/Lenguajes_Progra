%{ 
  #include<stdio.h> 
  #include "P4.tab.h" 
  void yyerror(char *);
%} 

%option noyywrap

/* Rule Section */
%% 

.                     yyerror("Unknown character");

%%