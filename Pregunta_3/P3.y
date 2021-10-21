%{ 
   #include<stdio.h> 
   #include<string.h>
   int yylex();
   void yyerror(char *s);

   int x = 0;
   int y = 0;

   void move(char *s, char *c){     
      
         if(s[0] == 'N'){
            printf("[Norte] ");
            y++;
         } 
         else if(s[0] == 'S'){
            printf("[Sur] ");
            y--;
         } 
         else if(s[0]== 'E'){
            printf("[Este] ");
            x++;
         } 
         else if(s[0] == 'O'){
            printf("[Oeste] ");
            x--;
         }      
   }
   void diag(char *s, char *c){
           
      switch(s[0]){
            case 'N': y++; printf(" [Nor"); break;
            case 'S': y--; printf(" [Sur"); break;            
         }
      switch(c[0]){            
            case 'O': x--; printf("Oeste] "); break;
            case 'E': x++; printf("Este] "); break;
         }
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
/*%token <strVal>EVALUAR*/
%token NUMERO
/*%type <strVal> Expr*/
/*%type <strVal> DIAG*/
/* Rule Section */
%% 
   INICIO : INICIO LETRA
      | LETRA
   ;

   LETRA : FIN      
      | EJEY NUMERO {move($1, $2);} 
      | EJEX NUMERO {move($1, $2);}  
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