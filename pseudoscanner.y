%{
	#include <stdio.h>
	#include <math.h>
	#include<stdlib.h>
	int yylex(void);
	extern void yyerror(char *);
%}
%token INTEIRO
%token INICIO
%token SQRT
%token ESCREVA
%left '^' '*' '/' '+' '-' '('  ')'
%token LEIA
%token SE
%token FIMSE
%token SENAO
%token PARA
%token ATE
%token PASSO
%token FIMPARA
%token ENTAO
%token REAL
%nonassoc FIMALGORITMO
%%
prog:
	prog funcao 
	|
	;
funcao:
	INICIO '\n' afirmacao '\n' le '\n' comp '\n' %prec FIMALGORITMO
	{exit(0);}
	|
	;
afirmacao:
	afirmacao exp '\n' {printf("%d \n", $3);}
	|ESCREVA exp '\n' {printf("%d \n", $2);}
	;
exp: 
	INTEIRO 		{ $$ = $1;}
	|exp '+' exp 	{ $$ = $1 + $2;}
	|exp '-' exp	{ $$ = $1 - $3;}
	|exp '*' exp	{ $$ = $1 * $3;}
	|exp '/' exp	{
		if($3 <= 0){
			printf("\nO divisor nao deve ser nulo!!!\n");
			exit(0);
		}else{
			$$ = $1 / $3;
		}		
	}
	|'(' exp ')'	{ $$ = $2;}
	|exp '^' exp	{ $$ = pow($1,$3);}
	|SQRT '(' exp ')' 	{ $$ = sqrt($3);}
le:
	LEIA '(' exp ')'
	|
	;
comp:
	SE cond ENTAO exp SENAO exp FIMSE	
	|
	;
cond:			
	cond afirmacao '=' INTEIRO
	|
	;	
%%
void yyerror(char *s){
	fprintf(stderr,"%s\n", s);
}
int main(){
	yyparse();
	return 0;
}
