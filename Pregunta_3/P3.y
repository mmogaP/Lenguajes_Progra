%{ 
   #include<stdio.h> 
   #include<string.h>
   int yylex();
   void yyerror(char *s);

%} 

%union {
    char *strVal;
    char charVal;
}

/* TOKENS */



/* Acciones de produccion */
%% 


%% 

void yyerror(char *s) { 
   printf("\n%s\n", s); 
}

int yywrap(){
    return 1;
}

int main(){
    return (yyparse());
}