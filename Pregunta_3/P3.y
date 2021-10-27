%{ 
   #include<stdio.h> 
   #include<string.h>
   int yylex();
   void yyerror(char *s);

   int x = 0;
   int y = 0;
   char numero[50]="1";
   char num[1];
   int cont=0;
   
   void numCadena(char *s){
      cont++;
      for(int i=0; i< cont; i++){
         if(i==(cont-1)){
            numero[i]=s[0];
         }
      }
   }

   void CalcularCoordenada(char *s, int c){     
      
         if(s[0] == 'N'){
            printf(" \nNorte *("); 
            if(strlen(numero)==0){
               printf("%d)",1);
            }
            for (int i = 0; i < strlen(numero); i++){
               if(i==strlen(numero)-1){
                  printf("%c)",numero[i]);
               }else{
                  printf("%c + ",numero[i]);
               }               
            }
            printf(" →  ");
            printf("(");for (int i = 0; i < c; i++) {;printf("[Norte]"); }printf(")");
            y+=c*(1);
         }
          
         else if(s[0] == 'S'){
            printf(" \nSur *("); 
            if(strlen(numero)==0){
               printf("%d)",1);
            }
            for (int i = 0; i < strlen(numero); i++){
               if(i==strlen(numero)-1){
                  printf("%c)",numero[i]);
               }else{
                  printf("%c + ",numero[i]);
               }               
            }
            printf(" →  ");
            printf("(");for (int i = 0; i < c; i++) {;printf("[Sur]"); }printf(")");
            y+=c*(-1);
         } 
         else if(s[0]== 'E'){
            printf(" \nEste *("); 
            if(strlen(numero)==0){
               printf("%d)",1);
            }
            for (int i = 0; i < strlen(numero); i++){
               if(i==strlen(numero)-1){
                  printf("%c)",numero[i]);
               }else{
                  printf("%c + ",numero[i]);
               }               
            }
            printf(" →  ");
            printf("(");for (int i = 0; i < c; i++) {;printf("[Este]"); }printf(")");
            x+=c*(1);
         } 
         else if(s[0] == 'O'){
            printf(" \nOeste *("); 
            if(strlen(numero)==0){
               printf("%d)",1);
            }
            for (int i = 0; i < strlen(numero); i++){
               if(i==strlen(numero)-1){
                  printf("%c)",numero[i]);
               }else{
                  printf("%c + ",numero[i]);
               }               
            }
            printf(" →  ");
            printf("(");for (int i = 0; i < c; i++) {;printf("[Oeste]"); }printf(")");
            x+=c*(-1);
         }      
         memset(numero,0,50);
         cont=0;
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
/* Rule Section */
%% 
   INICIO : INICIO LETRA
      | LETRA
      | NUMERO
   ;
   LETRA : FIN      
      | EJEY NUMERO {CalcularCoordenada($1,$2);} 
      | EJEX NUMERO {CalcularCoordenada($1,$2);}
      | EJEY {CalcularCoordenada($1,1);}     
      | EJEX {CalcularCoordenada($1,1);}    
   ;

   NUMERO : NUM {sprintf(num,"%d",$1);numCadena(num);}
            |NUM NUMERO {$$= $1 + $2;sprintf(num,"%d",$1);numCadena(num);} 
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