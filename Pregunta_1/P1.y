%{ 
   #include<stdio.h> 
   #include<string.h>
   int yylex();
   void yyerror(char *s);

   int x = 0;
   int y = 0;

   void move(char *s){
      for(int i = 0; i < strlen(s); i++){
         if(s[i] == 'N'){
            printf(" ↑ ");
            y++;
         } 
         else if(s[i] == 'S'){
            printf(" ↓ ");
            y--;
         } 
         else if(s[i] == 'E'){
            printf(" → ");
            x++;
         } 
         else if(s[i] == 'O'){
            printf(" ← ");
            x--;
         }
      }
      printf("\nCoordenadas: (%d,%d)", x,y);
   }

   void calcularcordenadas(char *s){
    int CordenadaX = 0;
    int CordenadaY = 0;

    for (int i = 0; i < strlen(s); i++) {
        switch(s[i]){
            case 'N': CordenadaY++; break;
            case 'S': CordenadaY--; break;
            case 'O': CordenadaX--; break;
            case 'E': CordenadaX++; break;
        }
    }

    printf("COORDENADAS: %d , %d", CordenadaX,CordenadaY);
}  
%} 
%union {
    char *strVal;
    char charVal;
}

/* declaramos los tokens */

%token <strVal>PALABRA
%token <strVal>EVALUAR
%type <strVal> Expr
/* Rule Section */
%% 
   INICIO
      : Expr
   ;

   Expr 
      : Expr PALABRA
      {move($2);}
      | PALABRA
      {move($1);}
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