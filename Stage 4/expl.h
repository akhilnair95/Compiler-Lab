#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "y.tab.h"

extern FILE* yyin;
	
#define INT 0
#define BOOL 1
#define VOID 2

int var[26];	// for storing variables

/** Sample Expression Tree Node Structure **/
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

	//Gsymbol *Gentry; // For global identifiers/functions

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
