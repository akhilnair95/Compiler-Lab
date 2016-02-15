%{
	#define YYSTYPE struct Tnode*
	#include "expl.h"
	#include "expl.c"
%}

%token READ WRITE ASG END STAT ID PLUS MUL NUM IF THEN ENDIF WHILE DO ENDWHILE EQ GT LT

%left EQ LT GT
%left PLUS
%left MUL

%%

Program : slist {Evaluate($1);};

slist : slist stmt {$$ = TreeCreate(INT,STAT,0,NULL,NULL,$1, $2, NULL);}|
		stmt {$$ = $1;};
	
stmt : ID ASG expr END { $$ = TreeCreate(INT,ASG,0,NULL,NULL,$1, $3, NULL);}
	  | READ '(' ID ')' END {$$ = TreeCreate(INT,READ,0,NULL,NULL,$3, NULL, NULL);}							
	  | WRITE '(' expr ')' END {$$ = TreeCreate(INT,WRITE,0,NULL,NULL,$3, NULL, NULL);}
	  | IF '(' expr ')' THEN slist ENDIF END {$$ = TreeCreate(INT,IF,0,NULL,NULL,$3,$6,NULL);}
	  | WHILE '(' expr ')' DO slist ENDWHILE END{$$ = TreeCreate(INT,WHILE,0,NULL,NULL,$3,$6, NULL);}; 
		
expr: expr PLUS expr {$$ = TreeCreate(INT,PLUS,0,NULL,NULL,$1, $3, NULL);}
	| expr MUL expr	{$$ = TreeCreate(INT,MUL,0,NULL,NULL,$1, $3, NULL);}
	| expr EQ expr {$$ = TreeCreate(INT,EQ,0,NULL,NULL,$1, $3, NULL);}
	| expr GT expr {$$ = TreeCreate(INT,GT,0,NULL,NULL,$1, $3, NULL);}
	| expr LT expr {$$ = TreeCreate(INT,LT,0,NULL,NULL,$1, $3, NULL);}
	| '(' expr ')'  {$$ = $2;}
	| NUM	{$$ = $1; }
	| ID	{$$ = $1;}
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
