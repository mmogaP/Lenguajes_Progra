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

%token NUMERO

/* Acciones de produccion */
%% 

 INICIO: Expr
   ;
   
   Expr : Expr PALABRA {CalcularCoordenadas($2);}
      | PALABRA {CalcularCoordenadas($1);}
   ;
exp: factor
 | exp SUMA factor { $$ = $1 + $3; }
 | exp RESTA factor { $$ = $1 * $3;  }
 ; 

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