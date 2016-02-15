%{
	#include <stdio.h>
	#include <stdlib.h>
	#include "y.tab.h"
%}

string [A-Za-z][A-Za-z1-9]+
%%

{string} {yylval = strdup(yytext);return STRING;}
"." {return '.';}
";" {return ';';}
[ \t] { }
.	 {yyerror("Invalid charater "); printf("%s\n",yytext); exit(1); }

%%

yywrap()
{
	printf("Ended");
	return 1;
}
