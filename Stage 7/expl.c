#include "interpreter.c"
#include "semantics.c"

struct Tnode *TreeCreate(int TYPE, int NODETYPE,int VALUE,char* NAME,struct Tnode* argList,struct Tnode* ptr1,struct Tnode* ptr2,struct Tnode* ptr3){
	struct Tnode* temp = (struct Tnode*) malloc (sizeof(struct Tnode));
	temp-> TYPE = TYPE;
	temp -> NODETYPE = NODETYPE;
	temp->VALUE = VALUE;
	temp->NAME = NAME;
	temp->ArgList = argList;
	temp -> Ptr1 = ptr1;
	temp -> Ptr2 = ptr2;
	temp -> Ptr3 = ptr3;
	temp -> Gentry = NULL;
	//temp -> Lentry = NULL;
	}

int getType(struct Tnode* t){
		return t-> TYPE;
	}
int getNodeType(struct Tnode* t){
		return t-> NODETYPE;
	}
int getValue(struct Tnode* t){
		return t-> VALUE;
	}
char* getName(struct Tnode* t){
		return t-> NAME;
	}
struct Tnode* getChild1(struct Tnode *t){
		return t-> Ptr1;
	}
struct Tnode* getChild2(struct Tnode* t){
		return t-> Ptr2;
	}
struct Tnode* getChild3(struct Tnode* t){
		return t-> Ptr3;
	}	
struct Gsymbol* getGentry(struct Tnode* t){
		return t-> Gentry;
	}

void setGentry(struct Tnode *t){
	struct Gsymbol *g = Glookup(getName(t));
	
	if(g == NULL)
		error("UNDECLARED VARIABLE");
	
	t->TYPE = g->TYPE;	
	t->Gentry = g;
}

struct Gsymbol* Glookup(char *s){
	// Returns Symbol table entry corresp to a string
	
	struct Gsymbol *t;
	
	t = symbolTable;
	
	while(t != NULL){
			if(strcmp(t->NAME,s) == 0)
				return t; 
			t = t -> NEXT;
		}
	
	return NULL;				
	}

void Install(struct Tnode *t, int type){
	// Receives a linked list of IDs and sets up Symbol Table for each 
	while(t != NULL){
			Ginstall(getName(t),type,getValue(t),NULL);
			t = getChild1(t);
		}
	}

void Ginstall(char* name,int type,int size, struct ArgStruct* arglist){
		
		if(Glookup(name) != NULL){
				error("Duplicate var names");
			}
		
		struct Gsymbol *t = (struct Gsymbol*)malloc(sizeof(struct Gsymbol));	
		t-> NAME = name;
		t-> TYPE = type;
		t->SIZE = size;
		t->ARGLIST = arglist;
		t->NEXT = NULL;
		t->BINDING = symbolAddress;
		
		symbolAddress += size;
		
		if(symbolTable == NULL){
				symbolTable = t;	
			}
		else{
			 struct Gsymbol *tmp = symbolTable;
			 while(tmp->NEXT != NULL){
					tmp = tmp-> NEXT;
				 }
			tmp->NEXT = t;
		}
	}
	
void error(char *s){
	printf("%s\n",s);
	exit(0);
	}	


