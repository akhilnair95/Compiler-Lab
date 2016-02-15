%{
	#include <stdio.h>
	#include <stdlib.h>
	#include "y.tab.h"
	
%}

%%

[a-z] {yylval.character = *yytext; return ID;}
[0-9]+ {yylval.integer = atoi(yytext);return NUM;}
"=" {return ASG;}
"+" {return PLUS;}
"*" {return MUL;}
";" {return *yytext;}
[()] {return *yytext;}
"read" {return READ;}
"write" {return WRITE;}
[\n] {return END;}
[ \t] {}
. {yyerror();}

%%

yywrap(){
	return 1;
}
