#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <locale.h>
#include <string.h>
#include <math.h>
#include "pseudoscanner.h"
//#include <iostream>
//#include "pseudoscanner.l"
//#include "pseudoparser.y"


/* run this program using the console pauser or add your own getch, system("pause") or input loop */

extern int yylex();
extern char *yytext; 

int main(int argc, char *argv[]) {
	
	setlocale(LC_ALL, "Portuguese");  
	
	return 0;
}
