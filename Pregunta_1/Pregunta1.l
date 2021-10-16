%{
/* Declaraciones */
int CordenadaX = 0;
int CordenadaY = 0;
%}

/* Reglas de traducción */
%%
[Nn] CordenadaY += 1;printf("Norte "); 
[Ss] CordenadaY -= 1;printf("Sur "); 
[Ee] CordenadaX += 1;printf("Este "); 
[Oo] CordenadaX -= 1;printf("Oeste "); 
\n return 0; 

%% 

int yywrap(){}
    int main () {    
    yylex();
    printf("\nCordenada: (%d,%d)\n",CordenadaX,CordenadaY);
    return 0;   
} 