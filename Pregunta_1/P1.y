%{ 
   #include<stdio.h> 
   #include<string.h>
   int yylex();
   void yyerror(char *s);

   int CordenadaX = 0;
   int CordenadaY = 0;
   
   void CalcularCoordenadas(char *s){
      for (int i = 0; i < strlen(s); i++) {
         switch(s[i]){
            case 'N': CordenadaY++;printf(" ↑ "); break;
            case 'S': CordenadaY--;printf(" ↓ "); break;
            case 'O': CordenadaX--;printf(" ← "); break;
            case 'E': CordenadaX++;printf(" → "); break;
         }
      }
   }   
   void coordenadas(){
      printf("\nCoordenadas: (%d,%d)\n", CordenadaX,CordenadaY);
      CordenadaX = 0;
      CordenadaY = 0;
   }
%} 

%union {
    char *strVal;
    char charVal;
}

/* TOKENS */
%token FINLINEA
%token <strVal>PALABRA
%token <strVal>EVALUAR

/* Acciones de produccion */
%% 
   INICIO: INICIO Expr
      | Expr
   ;

   Expr: FIN
      | Expr PALABRA {CalcularCoordenadas($2);}
      | PALABRA {CalcularCoordenadas($1);}
   ;

   FIN: FINLINEA {coordenadas();}
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