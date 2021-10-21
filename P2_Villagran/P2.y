%{ 
   #include<stdio.h> 
   #include<string.h>
   int yylex();
   void yyerror(char *s);

   int x = 0;
   int y = 0;

   void move(char *s){     
      
         if(s[0] == 'N'){
            printf("Norte ");
            y++;
         } 
         else if(s[0] == 'S'){
            printf("Sur ");
            y--;
         } 
         else if(s[0]== 'E'){
            printf("Este ");
            x++;
         } 
         else if(s[0] == 'O'){
            printf("Oeste ");
            x--;
         }
      
      
   }
   void diag(char *s, char *c){
      printf(" Entro en el diagonal (%s,%s)  ", c,s);
   }
   void coordenadas(){
      printf("\nCoordenadas: %d, %d\n", x,y);
   }
    
%} 
%union {
    char *strVal;
    char charVal;
}

/* declaramos los tokens */
%token FINLINEA
%token <strVal>EJEY
%token <strVal>EJEX
%token <strVal>EVALUAR
/*%type <strVal> Expr*/
%type <strVal> DIAG
/* Rule Section */
%% 
   INICIO : INICIO LETRA
      | LETRA
   ;
   LETRA : FIN
      | EJE FIN
   ;   
   EJE : DIAG      
      | DIAG EJEY {move($1); move($2);}      
      | EJEX EJE {move($1);}
   ;
   DIAG : DIAG EJEX {diag($1,$2);} 
      | EJEY {$$=$1;}
           
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