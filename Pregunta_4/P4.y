%{ 
   #include<stdio.h> 
   #include<string.h>
   int yylex();
   void yyerror(char *s);

   int x = 0;
   int y = 0;

   void CalcularCoordenada(char *s, int c){     
      
         if(s[0] == 'N'){
            for (int i = 0; i < strlen(s); i++) {;printf(" \nNorte →\t"); }
            printf("(");for (int i = 0; i < c; i++) {;printf("[Norte]"); }printf(")");
            y+=c*(1);
         }
          
         else if(s[0] == 'S'){
            for (int i = 0; i < strlen(s); i++) {;printf(" \nSur →\t"); }
            printf("(");for (int i = 0; i < c; i++) {;printf("[Sur]"); }printf(")");
            y+=c*(-1);
         } 
         else if(s[0]== 'E'){
            for (int i = 0; i < strlen(s); i++) {;printf(" \nEste →\t"); }
            printf("(");
            for (int i = 0; i < c; i++) {;printf("[Este]"); }
            x+=c*(1);
         } 
         else if(s[0] == 'O'){
            for (int i = 0; i < strlen(s); i++) {;printf(" \nOeste →\t"); }
            printf("(");
            for (int i = 0; i < c; i++) {;printf("[Oeste]"); }
            x+=c*(-1);
         }      
   }
   void CalcularDiagonal(char *s, char *c, int i){
           
      switch(s[0]){
            case 'N': y+=i*(1); printf(" [Nor"); break;
            case 'S': y+=i*(-1); printf(" [Sur"); break;            
         }
      switch(c[0]){            
            case 'O': x+=i*(1); printf("Oeste] "); break;
            case 'E': x+=i*(-1); printf("Este] "); break;
         }
   }
   void coordenadas(){
      printf("\nCoordenadas: (%d,%d)\n", x,y);
      x = 0;
      y = 0;
   }
    
%} 
%union {
   char *strVal;
   char charVal;
   int c;
}

/* declaramos los tokens */
%token FINLINEA
%token <strVal>EJEY
%token <strVal>EJEX
%type <c> NUMERO
%token <c> NUM
/*%token <strVal>EVALUAR*/
/*%type <strVal> Expr*/
/*%type <strVal> DIAGONAL*/
/* Rule Section */
%% 
   INICIO : INICIO LETRA
      | LETRA
   ;
   LETRA : FIN      
      | DIAGONAL
      | EJEY NUMERO {CalcularCoordenada($1,$2);} 
      | EJEX NUMERO {CalcularCoordenada($1,$2);}
      | EJEY {CalcularCoordenada($1,1);}     
      | EJEX {CalcularCoordenada($1,1);}    
   ;

   NUMERO : NUM
            |NUM NUMERO {$$= $1 + $2;} 
   ;  
   DIAGONAL : EJEY EJEX NUMERO {CalcularDiagonal($1,$2,$3);}  
            | EJEY EJEX {CalcularDiagonal($1,$2,1);}
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
  

/*
Expr 
   : Expr PALABRA
   {printf("%s",$2);}
   | PALABRA
   {printf("%s",$1);}
; 
*/