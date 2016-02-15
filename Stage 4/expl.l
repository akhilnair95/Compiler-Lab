%{
	#include <stdio.h>
	#include <stdlib.h>
	#include "y.tab.h"
	
%}

%%

[a-z] {yylval = TreeCreate(0,ID,0,strdup(yytext),NULL,NULL,NULL,NULL);
		return ID;}
		
[0-9]+ {
		yylval = TreeCreate(0,NUM,atoi(yytext),NULL,NULL,NULL,NULL,NULL);
		return NUM;}

"=" {return ASG;}
"==" {return EQ;}
"+" {return PLUS;}
"*" {return MUL;}
";" {return END;}
[()] {return *yytext;}
"read" {return READ;}
"write" {return WRITE;}
"if" {return IF;}
"then" {return THEN;}
"endif" {return ENDIF;}
"while" {return WHILE;}
"do" {return DO;}
"endwhile" {return ENDWHILE;}
"<" {return LT;}
">" {return GT;}
[ \t\n] {}
. {yyerror();}

%%

yywrap(){
	return 1;
}
