%{
	#include <stdio.h>
	#include <stdlib.h>
	#include "y.tab.h"
	#include "types.h"
%}

%%

		
[0-9]+ {
		yylval = TreeCreate(TYPE_INT,NUM,atoi(yytext),NULL,NULL,NULL,NULL,NULL);
		return NUM;
		}

"=" {return ASG;}
"==" {return EQ;}
"+" {return PLUS;}
"-" {return MINUS;}
"*" {return MUL;}
";" {return END;}
[(),] {return *yytext;}
"]" {return *yytext;}
"[" {return *yytext;}
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
"decl" {return DECL;}
"enddecl" {return ENDDECL;}
"int" {return INT;}

[A-Za-z][A-Za-z0-9]* {yylval = TreeCreate(TYPE_INT,ID,0,strdup(yytext),NULL,NULL,NULL,NULL);
		return ID;}

[ \t\n] {}

. {printf("Token error %s\n",yytext);yyerror();}

%%

yywrap(){
	return 1;
}
