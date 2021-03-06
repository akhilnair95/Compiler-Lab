%{
	#include <stdio.h>
	#include <stdlib.h>
	#include "y.tab.h"
%}

%%

[0-9]+ {yylval = atoi(yytext);return DIGIT;}
"+"	{return *yytext;}
"-"	{return *yytext;}
"*"	{return *yytext;}
"("	{return *yytext;}
")"	{return *yytext;}
";"	{return *yytext;}
[\n| ] { }
.	 {yyerror("Invalid charater "); printf("%s\n",yytext); exit(1); }

%%

yywrap()
{
	printf("Ended");
	return 1;
}
