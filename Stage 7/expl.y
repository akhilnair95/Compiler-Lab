%{
	#define YYSTYPE struct Tnode*
	#include "expl.h"
	#include "expl.c"
%}

%token READ WRITE ASG END STAT ID PLUS MUL NUM MINUS IF THEN ELSE ENDIF WHILE DO ENDWHILE EQ GT LT DECL ENDDECL INT DIV MOD BOOL TRUE FALSE AND OR NOT

%left OR
%left AND
%left EQ
%left LT GT
%left PLUS MINUS
%left MUL DIV MOD
%right NOT

%%

Program : gdecl slist {SemanticCheck($2); Evaluate($2);};

gdecl : DECL declist ENDDECL{};

declist : declist decstat {}
			| decstat{};

decstat : INT idlist END{Install($2,TYPE_INT);}
			| BOOL idlist END{Install($2,TYPE_BOOL);} 	
;
			 
idlist : id ',' idlist {$1->Ptr1 = $3; $$ = $1;}
		| 	id{$$ = $1;};

id : ID {$$ = $1;} 
			| ID '[' NUM ']' {
				if(getValue($3)<1){error("Invalid Array declaration");}
				$1->VALUE = $3->VALUE;
				$$ = $1;
			}		
				

slist : slist stmt {$$ = TreeCreate(TYPE_VOID,STAT,0,NULL,NULL,$1, $2, NULL);}
		|	stmt {$$ = $1;};
	
stmt : BID ASG expr END { $$ = TreeCreate(TYPE_VOID,ASG,0,NULL,NULL,$1, $3, NULL);}
	  |	BID '[' expr ']' ASG expr END {$$ = TreeCreate(TYPE_VOID,ASG,0,NULL,NULL,$1, $3, $6);};
	  | READ '(' BID ')' END {setGentry($3);$$ = TreeCreate(TYPE_VOID,READ,0,NULL,NULL,$3, NULL, NULL);}
	  | READ '(' BID '[' expr ']' ')' END {setGentry($3);$$ = TreeCreate(TYPE_VOID,READ,0,NULL,NULL,$3, $5 , NULL);}							
	  | WRITE '(' expr ')' END {$$ = TreeCreate(TYPE_VOID,WRITE,0,NULL,NULL,$3, NULL, NULL);}
	  | IF '(' expr ')' THEN slist ENDIF END {$$ = TreeCreate(TYPE_VOID,IF,0,NULL,NULL,$3,$6,NULL);}
	  | IF '(' expr ')' THEN slist ELSE slist ENDIF END {$$ = TreeCreate(TYPE_VOID,ELSE,0,NULL,NULL,$3,$6,$8);}
	  | WHILE '(' expr ')' DO slist ENDWHILE END{$$ = TreeCreate(TYPE_VOID,WHILE,0,NULL,NULL,$3,$6, NULL);}; 
		
expr: expr PLUS expr {$$ = TreeCreate(TYPE_INT,PLUS,0,NULL,NULL,$1, $3, NULL);}
	| expr MINUS expr {$$ = TreeCreate(TYPE_INT,MINUS,0,NULL,NULL,$1, $3, NULL);}
	| expr MUL expr	{$$ = TreeCreate(TYPE_INT,MUL,0,NULL,NULL,$1, $3, NULL);}
	| expr DIV expr	{$$ = TreeCreate(TYPE_INT,DIV,0,NULL,NULL,$1, $3, NULL);}
	| expr MOD expr	{$$ = TreeCreate(TYPE_INT,MOD,0,NULL,NULL,$1, $3, NULL);}
	| expr EQ expr {$$ = TreeCreate(TYPE_BOOL,EQ,0,NULL,NULL,$1, $3, NULL);}
	| expr GT expr {$$ = TreeCreate(TYPE_BOOL,GT,0,NULL,NULL,$1, $3, NULL);}
	| expr LT expr {$$ = TreeCreate(TYPE_BOOL,LT,0,NULL,NULL,$1, $3, NULL);}
	| expr AND expr {$$ = TreeCreate(TYPE_BOOL,AND,0,NULL,NULL,$1, $3, NULL);}
	| expr OR expr {$$ = TreeCreate(TYPE_BOOL,OR,0,NULL,NULL,$1, $3, NULL);}
	| NOT expr {$$ = TreeCreate(TYPE_BOOL,NOT,0,NULL,NULL,$2, NULL, NULL);}
	| '(' expr ')'  {$$ = $2;}
	| NUM	{$$ = $1; }
	| BID	{$$ = $1;}
	| BID '[' expr ']' {$$ = TreeCreate(TYPE_INT,ID,0,NULL,NULL,$1, $3, NULL);}
	| TRUE {$$ = TreeCreate(TYPE_BOOL,BOOL,TRUE,NULL,NULL,NULL,NULL,NULL);}
	| FALSE {$$ = TreeCreate(TYPE_BOOL,BOOL,FALSE,NULL,NULL,NULL,NULL,NULL);}
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
