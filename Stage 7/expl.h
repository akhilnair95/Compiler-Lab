#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "y.tab.h"
#include "types.h"

extern FILE* yyin;

struct ArgStruct{
	int x;
	};

struct Gsymbol {

	char *NAME; // Name of the Identifier

	int TYPE; // TYPE can be INTEGER or BOOLEAN

/***The TYPE field must be a TypeStruct if user defined types are allowed***/

	int SIZE; // Size field for arrays

	int BINDING; // Address of the Identifier in Memory

	struct ArgStruct *ARGLIST; // Argument List for functions

/***Argstruct must store the name and type of each argument ***/

	struct Gsymbol *NEXT; // Pointer to next Symbol Table Entry */

};


struct Gsymbol *symbolTable = NULL; 
int symbolAddress = 0;

int var[100];

void Ginstall(char*,int,int,struct ArgStruct*); // Installation

struct Gsymbol* Glookup(char*);

void setGentry(struct Tnode*); // Lookup a global Identifier

struct Tnode {

	int TYPE; // Integer, Boolean or Void (for statements)

/* Must point to the type expression tree for user defined types */

	int NODETYPE;

/* this field should carry following information:

* a) operator : (+,*,/ etc.) for expressions

* b) statement Type : (WHILE, READ etc.) for statements */


	int VALUE; // for constants
	
	char* NAME; // For Identifiers/Functions

	struct Tnode *ArgList; // List of arguments for functions

	struct Tnode *Ptr1, *Ptr2, *Ptr3;

/* Maximum of three subtrees (3 required for IF THEN ELSE */

	struct Gsymbol *Gentry; // For global identifiers/functions

	//Lsymbol *Lentry; // For Local variables

};


struct Tnode *TreeCreate(int,int,int,char*,struct Tnode*,struct Tnode*, struct Tnode*, struct Tnode*);

int Evaluate(struct Tnode*);

int getType(struct Tnode*);
int getNodeType(struct Tnode*);
int getValue(struct Tnode*);
char* getName(struct Tnode*);
struct Tnode* getChild1(struct Tnode*);
struct Tnode* getChild2(struct Tnode*);
struct Tnode* getChild3(struct Tnode*);
struct Gsymbol* getGentry(struct Tnode*);

void error(char*);

void Install(struct Tnode*,int);
