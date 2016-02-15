%{
	#define YYSTYPE struct Tnode*
	#include "expl.h"
	#include "expl.c"
%}

%token READ WRITE ASG END STAT ID PLUS MUL NUM MINUS IF THEN ENDIF WHILE DO ENDWHILE EQ GT LT DECL ENDDECL INT

%left EQ LT GT
%left PLUS MINUS
%left MUL

%%

Program : gdecl slist {Evaluate($2);};

gdecl : DECL declist ENDDECL{};

declist : declist decstat {}
			| decstat{};

decstat : INT idlist END{};
			 
idlist : id ',' idlist|
			id;

id : ID {Ginstall(getName($1),INT,1,NULL);} 
			| ID '[' NUM ']' {
				if(getValue($3)<1){error("Invalid Array declaration");}
				Ginstall(getName($1),INT,getValue($3),NULL);
			}		
				

slist : slist stmt {$$ = TreeCreate(INT,STAT,0,NULL,NULL,$1, $2, NULL);}|
		stmt {$$ = $1;};
	
stmt : BID ASG expr END { $$ = TreeCreate(INT,ASG,0,NULL,NULL,$1, $3, NULL);}
	  |	BID '[' expr ']' ASG expr END {$$ = TreeCreate(INT,ASG,0,NULL,NULL,$1, $3, $6);};
	  | READ '(' BID ')' END {setGentry($3);$$ = TreeCreate(INT,READ,0,NULL,NULL,$3, NULL, NULL);}
	  | READ '(' BID '[' expr ']' ')' END {setGentry($3);$$ = TreeCreate(INT,READ,0,NULL,NULL,$3, $5 , NULL);}							
	  | WRITE '(' expr ')' END {$$ = TreeCreate(INT,WRITE,0,NULL,NULL,$3, NULL, NULL);}
	  | IF '(' expr ')' THEN slist ENDIF END {$$ = TreeCreate(INT,IF,0,NULL,NULL,$3,$6,NULL);}
	  | WHILE '(' expr ')' DO slist ENDWHILE END{$$ = TreeCreate(INT,WHILE,0,NULL,NULL,$3,$6, NULL);}; 
		
expr: expr PLUS expr {$$ = TreeCreate(TYPE_INT,PLUS,0,NULL,NULL,$1, $3, NULL);}
	| expr MINUS expr {$$ = TreeCreate(TYPE_INT,MINUS,0,NULL,NULL,$1, $3, NULL);}
	| expr MUL expr	{$$ = TreeCreate(TYPE_INT,MUL,0,NULL,NULL,$1, $3, NULL);}
	| expr EQ expr {$$ = TreeCreate(TYPE_BOOL,EQ,0,NULL,NULL,$1, $3, NULL);}
	| expr GT expr {$$ = TreeCreate(TYPE_BOOL,GT,0,NULL,NULL,$1, $3, NULL);}
	| expr LT expr {$$ = TreeCreate(TYPE_BOOL,LT,0,NULL,NULL,$1, $3, NULL);}
	| '(' expr ')'  {$$ = $2;}
	| NUM	{$$ = $1; }
	| BID	{$$ = $1;}
	| BID '[' expr ']' {$$ = TreeCreate(TYPE_INT,ID,0,NULL,NULL,$1, $3, NULL);}
	;
		
BID : ID {setGentry($1); $$ = $1;}		

%%

yyerror()
{
	printf("Syntax Error \n");
	exit(0);
}


main(){
 yyin = fopen("ip.txt","r");
 yyparse();
 return 1;
}
