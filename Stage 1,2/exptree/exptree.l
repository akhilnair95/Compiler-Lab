%{
	#include <stdio.h>
	#include <stdlib.h>
	#include "y.tab.h"
%}

%%

[0-9]+ {yylval = makeLeafNode(atoi(yytext));return NUM;}
"+"	{return PLUS;}
"-"	{return MINUS;}
"*"	{return MUL;}
[()]	{return *yytext;}
";"	{return END;}
[ \t\n] { }
.	 {yyerror("Invalid charater "); printf("%s\n",yytext); exit(1); }

%%

yywrap()
{
	printf("Ended");
	return 1;
}
