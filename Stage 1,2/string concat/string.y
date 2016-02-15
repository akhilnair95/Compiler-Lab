%{

	#include <stdio.h>
	#include<stdlib.h>
	#include <string.h>
	#define YYSTYPE char*

	char* concat(char*,char*);
 %}

%token STRING		 
%left '.'

%%

start : str ';' {printf("%s",$$);exit(1);}
;

str: str '.' str {$$ = concat($1,$3);}
	| STRING {$$ = $1;}
	;

%%

char* concat(char *a,char *b){
	char *s = (char *)malloc(sizeof(char)*(strlen(a) + strlen(b)));
	strcpy(s,a);
	strcat(s,b);
	return s;
}

yyerror()
{
	printf("Error");
}


main(){
 yyparse();
 return 1;
}
