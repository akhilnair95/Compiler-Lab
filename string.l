%option noyywrap

%{
	#include <stdlib.h>
	#include <stdio.h>
%}

char [A-Za-z]
num [0-9]+
string [A-Za-z][A-Za-z1-9]+

%%

{num} {printf("NUMBER");}
{string} {printf("STRING");}

%%

int main(){
	yylex();
	return 1;
}
