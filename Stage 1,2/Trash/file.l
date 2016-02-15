/* Declarations */

%{
	#include<stdio.h>
	#include<stdlib.h>
%}

num	[0-9]+
op	[+|-|*|/|%]
string [A-Za-z][A-Za-z1-9]*
/* Rules */

%%

{num} {printf("Number[%s]",yytext);}
{op} {printf("operator[%s]",yytext);}
{string} {printf("String[%s]",yytext);}
[ |\n|\t] {}
.	{ yyerror("Invalid charater "); printf("%s\n",yytext); exit(1); }

%%

/*	Auxilary functions */

int main(int argc, char* argv[]){
	
	if(argc > 1){
		
		FILE * fp = fopen(argv[1],"r");
		
		if(fp)
			yyin = fp;
	}
	
	int r = yylex();
		
	return 1;
}

int yywrap(){
	if(yyin != stdin){
		yyin = stdin;
		return 0;
	}
	printf("Ending\n");
	return 1;
}

yyerror(char const *s){
    printf("yyerror %s",s);
}
