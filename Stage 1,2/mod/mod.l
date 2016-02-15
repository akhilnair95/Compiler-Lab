%{
	#include <stdio.h>
	#include <stdlib.h>
	#include "y.tab.h"
%}

%%

[0-9]+ {yylval = strdup(yytext); return DIGIT;}
"+"	{return *yytext;}
"-"	{return *yytext;}
"*"	{return *yytext;}
"("	{return *yytext;}
")"	{return *yytext;}
";"	{return *yytext;}
[ \t\n] { }
.	 {yyerror("Invalid charater "); printf("%s\n",yytext); exit(1); }

%%

yywrap()
{
	printf("Ended");
	return 1;
}
