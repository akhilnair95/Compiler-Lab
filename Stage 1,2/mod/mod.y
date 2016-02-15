%{

    #include <stdio.h>
	#include<stdlib.h>
	#include <string.h>
	#define YYSTYPE char*

	char* concat(char*,char*);
	char* para(char*,char*,char*);
 %}

%token DIGIT
%left '+' '-'
%left '*'
		 
%%

start : expr ';' {printf("%s",$$);exit(1);}
;

expr: expr '+' expr {$$ = para($1,$3,"+");}
	| expr '-' expr	{$$ = para($1,$3,"-");}
	| expr '*' expr	{$$ = para($1,$3,"*");}
	| '(' expr ')' {$$ = $2;}
	| DIGIT	{$$ = $1;}
	;

%%

char* concat(char *a,char *b){
	char *s = (char *)malloc(sizeof(char)*(strlen(a) + strlen(b)));
	strcpy(s,a);
	strcat(s,b);
	return s;
}

char* para(char *exp1,char *exp2,char *sym){
	return concat("(",concat(exp1,concat(sym,concat(exp2,")"))));
}

yyerror()
{
	printf("Error");
}


main(){
 yyparse();
 return 1;
}
