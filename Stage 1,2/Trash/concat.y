%{
	#include<stdio.h>
%}

%token string
%left '+'
%%

start : str

str : str '+' str
	|	string		{printf("STRING");}

%%

yyerror(char const *s){
	printf("yyerror : %s",s);
}

yylex(){
		char c;
		c = getchar();
		if(c == '+')
			return '+';
		if(c == '\n'){
			printf("\n NEW \n");
			yylex();
			}
		else{
				printf("str \n");
				return string;
			}	
}

int main(){
	yyparse();
	return 1;
}
