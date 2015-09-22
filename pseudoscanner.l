%{
	#include <stdio.h>
	#include<stdlib.h>
	#include "pseudoparser.tab.h"
	void yyerror(char*);
%}
digito [0-9]
inicio  [iI][nN][iI][cC][iI][oO]
fimalgoritmo     [fF][iI][mM][aA][lL][gG][oO][rR][iI][tT][mM][oO]
escreva [eE][sS][cC][rR][eE][vV][aA]
sqrt	[sS][qQ][rR][tT]
entao	[eE][nN][tT][aA][oO]
se		[sS][eE]
senao	[sS][eE][nN][aA][oO]
fimse	[fF][iI][mM][sS][eE]
ate		[aA][tT][eE]
para	[pP][aA][rR][aA]
passo	[pP][aA][sS][sS][aA]
leia	[lL][eE][iI][aA]
fimpara [fF][iI][mM][pP][aA][rR][aA]
real	[rR][eE][aA][lL]
%%
{digito}+ {yylval = atoi(yytext);
			return INTEIRO;
		  }
{inicio}    {return INICIO;}
{escreva}   {return ESCREVA;}
{leia}	{return LEIA;}
{se}		{return SE;}
{fimse}	{return FIMSE;}
{senao}	{return SENAO;}
{ate}		{return ATE;}
{passo}	{return PASSO;}
{entao}	{return ENTAO;}		
{para}	{return PARA;}
{fimpara}	{return FIMPARA;}
{fimalgoritmo}  {return FIMALGORITMO;}
[-+*/^()\n] {return *yytext;}  
[sqrt] {return SQRT;}
{real}	{return REAL;}
[\t]	;
.	{printf("\nCaractere Invalido !!!!!\n");}
%%
int yywrap(){
	return 1;
}
