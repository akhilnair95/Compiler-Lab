%{
	#include <stdio.h>
	#include <stdlib.h>
	
	int num;
	int dig;
%}

%%

[0-9]* { num++;dig += yyleng;}
[ \t\n] { }
.	 { }

%%


main(){
	yyin = fopen("test.txt","r");
	yylex();
	return 1;
}
yywrap()
{
	printf("Numbers = %d, digits = %d",num,dig);
	return 1;
}
