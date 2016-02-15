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
"%" {return MOD;}
"/" {return DIV;}
";" {return END;}
[(),] {return *yytext;}
"]" {return *yytext;}
"[" {return *yytext;}
"read" {return READ;}
"write" {return WRITE;}
"if" {return IF;}
"then" {return THEN;}
"else" {return ELSE;}
"endif" {return ENDIF;}
"while" {return WHILE;}
"do" {return DO;}
"endwhile" {return ENDWHILE;}
"<" {return LT;}
">" {return GT;}
"decl" {return DECL;}
"enddecl" {return ENDDECL;}
"integer" {return INT;}
"boolean" {return BOOL;}
"TRUE" {return TRUE;}
"FALSE" {return FALSE;}
"AND" {return AND;}
"OR" {return OR;}
"NOT" {return NOT;}
[A-Za-z][A-Za-z0-9]* {yylval = TreeCreate(TYPE_INT,ID,1,strdup(yytext),NULL,NULL,NULL,NULL); // size set in value field
		return ID;}

[ \t\n] {}

. {printf("Token error %s\n",yytext);yyerror();}

%%

yywrap(){
	return 1;
}
