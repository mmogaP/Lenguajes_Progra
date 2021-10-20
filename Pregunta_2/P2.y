%{ 
   #include<stdio.h> 
   #include<string.h>
   int yylex();
   void yyerror(char *s);

   void CalcularCoordenadas(char *s){
      int CordenadaX = 0;
      int CordenadaY = 0;

      for (int i = 0; i < strlen(s); i++) {
         switch(s[i]){
            case 'N': CordenadaY++;printf(" ↑ "); break;
            case 'S': CordenadaY--;printf(" ↓ "); break;
            case 'O': CordenadaX--;printf(" ← "); break;
            case 'E': CordenadaX++;printf(" → "); break;
         }
      }
   printf("\nCOORDENADAS: (%d,%d)", CordenadaX,CordenadaY);
}

%} 

%union {
    char *strVal;
    char charVal;
}

/* TOKENS */

%token <strVal>PALABRA
%token <strVal>EVALUAR
%type <strVal> Expr

/* Acciones de produccion */
%% 
   INICIO: Expr
   ;
   
   Expr : Expr PALABRA {CalcularCoordenadas($2);}
      | PALABRA {CalcularCoordenadas($1);}
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