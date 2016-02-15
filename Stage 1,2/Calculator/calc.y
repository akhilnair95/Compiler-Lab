%{

   #include <stdio.h>
	#include<stdlib.h>
 %}

%token DIGIT
%left '+' '-'
%left '*'
		 
%%

start : expr ';' {printf("%d",$$);exit(1);}
;

expr: expr '+' expr {$$ = $1+$3;}
	| expr '-' expr	{$$ = $1-$3;}
	| expr '*' expr	{$$ = $1*$3;}
	| '(' expr ')' {$$ = $2;}
	| DIGIT	{$$ = $1;}
	;

%%


yyerror()
{
	printf("Error");
}


main(){
 yyparse();
 return 1;
}
