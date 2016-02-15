%{
	#include <stdio.h>
	#include <stdlib.h>
	int var[26];
	extern FILE* yyin;
%}

%union{
	int integer;
	char character; 
}

%token READ WRITE ASG END
%token <integer> ID 
%token <character> PLUS
%token <character> MUL 
%token <integer> NUM
%type <integer> expr
%left PLUS
%left MUL

%%

Program : slist END {};

slist : slist stmt {}|
		stmt {};
	
stmt : ID ASG expr ';' { 
						 var[$1 - 'a'] = $3;
						}|
		READ '(' ID ')' ';' {
							scanf("%d",&var[$3 - 'a']);}|
							
		WRITE '(' expr ')' ';' {printf("%d\n",$3);};
		
expr: expr PLUS expr {$$ = $1 + $3;}
	| expr MUL expr	{$$ = $1 * $3;}
	| '(' expr ')'  {$$ = $2;}
	| NUM	{$$ = $1;}
	| ID	{
					$$ = var[$1 - 'a'];
			}
	;
		
%%

yyerror()
{
	printf("Error");
}


main(){
 yyin = fopen("ip.txt","r");
 yyparse();
 return 1;
}
