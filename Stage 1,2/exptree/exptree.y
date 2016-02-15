%{

   #include <stdio.h>
	#include<stdlib.h>
	#include "exptree.h"
	#include "exptree.c"
	#define YYSTYPE struct node*
 %}

%token NUM PLUS MINUS MUL DIV END
%left PLUS MINUS
%left MUL DIV
		 
%%

start : expr END {printf("%d",evaluate($$));exit(1);}
;

expr: expr PLUS expr {$$ = makeNode($1,$3,'+');}
	| expr MINUS expr	{$$ = makeNode($1,$3,'-');}
	| expr MUL expr	{$$ = makeNode($1,$3,'*');}
	| '(' expr ')' {$$ = $2;}
	| NUM	{$$ = $1;printf("%d",atoi(yytext));}
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
