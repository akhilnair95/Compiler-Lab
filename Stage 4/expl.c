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
	//temp -> Gentry = NULL;
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


int Evaluate(struct Tnode* t){
	
		switch(getNodeType(t)){
				
				case STAT:
					Evaluate(getChild1(t));
					Evaluate(getChild2(t));
				break;
				
				case ASG:
					var[*getName(getChild1(t)) - 'a'] = Evaluate(getChild2(t));
				break;
				
				case READ:
					scanf("%d",&var[*getName(getChild1(t)) - 'a']);
				break;
				
				case WRITE:
					printf("%d\n",Evaluate(getChild1(t)));
				break;
				
				case PLUS:
					return Evaluate(getChild1(t)) + Evaluate(getChild2(t));
				break;
				
				case MUL:
					return Evaluate(getChild1(t)) * Evaluate(getChild2(t));
				break;
				
				case NUM:
					return getValue(t);
				break;
				
				case ID:
					return var[*getName(t) - 'a'];
				break;
				
				case EQ:
					if(Evaluate(getChild1(t)) == Evaluate(getChild2(t)))
						return 1;
					else
						return 0;
				break;
				
				case LT:
					if(Evaluate(getChild1(t)) < Evaluate(getChild2(t)))
						return 1;
					else
						return 0;
				break;
				
				case GT:
					if(Evaluate(getChild1(t)) > Evaluate(getChild2(t)))
						return 1;
					else
						return 0;
				break;
				
				case IF:
					if(Evaluate(getChild1(t)) != 0)
						Evaluate(getChild2(t));
				break;
				
				case WHILE:
					while(Evaluate(getChild1(t)) != 0)
						Evaluate(getChild2(t));
				break;
		}
		return 0;
	}
