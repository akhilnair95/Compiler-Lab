
void SemanticCheck(struct Tnode* t){
	
		switch(getNodeType(t)){
				
				case STAT:
					SemanticCheck(getChild1(t));
					SemanticCheck(getChild2(t));
				break;
				
				case ASG:		
					if(getType(getChild1(t)) != getType(getChild2(t)))
						error("Assignment Type Mismatch");
					SemanticCheck(getChild2(t));	
				break;
				
				case READ:
					if(getType(getChild1(t)) != TYPE_INT)
						error("Read of Boolean var not allowed");
				break;
				
				case WRITE:
					if(getType(getChild1(t)) != TYPE_INT)
						error("Write of Boolean expression not allowed");
					SemanticCheck(getChild1(t));
				break;
				
				case PLUS:
				case MINUS:
				case MUL:
				case DIV:
				case MOD:
					if(getType(getChild1(t)) != TYPE_INT || getType(getChild1(t)) != TYPE_INT)
						error("Boolean operations not allowed");
						
					SemanticCheck(getChild1(t));
					SemanticCheck(getChild2(t));
				break;
				
				
				case NUM:
				case ID:
					
				break;
								
				case EQ:
				case LT:
				case GT:
					if(getType(getChild1(t)) != TYPE_INT || getType(getChild1(t)) != TYPE_INT)
						error("Boolean comparisons not allowed");
					
					SemanticCheck(getChild1(t));
					SemanticCheck(getChild2(t));	
				break;
				
				case AND:
				case OR:
					if(getType(getChild1(t)) != TYPE_BOOL || getType(getChild1(t)) != TYPE_BOOL)
						error("Only Boolean logical operators allowed");
					
					SemanticCheck(getChild1(t));
					SemanticCheck(getChild2(t));	
				break;
				
				case NOT:
					if(getType(getChild1(t)) != TYPE_BOOL)
						error("Only Boolean logical operators allowed");
					
					SemanticCheck(getChild1(t));
				break;
								
				case IF:
				case ELSE:
				case WHILE:
					if(getType(getChild1(t)) != TYPE_BOOL)
						error("Non Logical Expression Condition");
					SemanticCheck(getChild1(t));
				break;
				
		}
		
	}
