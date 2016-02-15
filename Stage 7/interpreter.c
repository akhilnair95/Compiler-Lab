
int Evaluate(struct Tnode* t){
	
		switch(getNodeType(t)){
				
				case STAT:
					Evaluate(getChild1(t));
					Evaluate(getChild2(t));
				break;
				
				case ASG:
				
					if(getChild3(t) == NULL)
						var[getGentry(getChild1(t)) -> BINDING] = Evaluate(getChild2(t));			
					else{
						var[( getGentry(getChild1(t)) -> BINDING ) + Evaluate(getChild2(t))] = Evaluate(getChild3(t));
					}
				break;
				
				case READ:
				
					if(getChild2(t) == NULL)
						scanf("%d",&var[getGentry(getChild1(t)) -> BINDING]);			
					else
						scanf("%d",&var[(getGentry(getChild1(t)) -> BINDING) + Evaluate(getChild2(t))]);
					
				break;
				
				case WRITE:
					printf("%d\n",Evaluate(getChild1(t)));
				break;
				
				case PLUS:
					return Evaluate(getChild1(t)) + Evaluate(getChild2(t));
				break;
				
				case MINUS:
					return Evaluate(getChild1(t)) - Evaluate(getChild2(t));
				break;
				
				case MUL:
					return Evaluate(getChild1(t)) * Evaluate(getChild2(t));
				break;
				
				case DIV:
					return Evaluate(getChild1(t)) / Evaluate(getChild2(t));
				break;
				
				case MOD:
					return Evaluate(getChild1(t)) % Evaluate(getChild2(t));
				break;
				
				case NUM:
					return getValue(t);
				break;
				
				case ID:
					if(getChild1(t) == NULL)
						return var[getGentry(t) -> BINDING];
					else
						return var[(getGentry(getChild1(t)) -> BINDING) + Evaluate(getChild2(t))];
				break;
				
				case EQ:
					if(Evaluate(getChild1(t)) == Evaluate(getChild2(t)))
						return TRUE;
					else
						return FALSE;
				break;
				
				case LT:
					if(Evaluate(getChild1(t)) < Evaluate(getChild2(t)))
						return TRUE;
					else
						return FALSE;
				break;
				
				case GT:
				
					if(Evaluate(getChild1(t)) > Evaluate(getChild2(t)))
						return TRUE;
					else
						return FALSE;
				break;
				
				case AND:
					if(Evaluate(getChild1(t)) == TRUE && Evaluate(getChild2(t)) == TRUE)
						return TRUE;
					else
						return FALSE;
				break;
				
				case OR:
					if(Evaluate(getChild1(t)) == TRUE || Evaluate(getChild2(t)) == TRUE)
						return TRUE;
					else
						return FALSE;
				break;
				
				case NOT:
					if(Evaluate(getChild1(t)) == FALSE)
						return TRUE;
					else
						return FALSE;
				break;
				
				case IF:
								
					if(Evaluate(getChild1(t)) == TRUE)
						Evaluate(getChild2(t));
						
				break;
				
				case ELSE:
					if(Evaluate(getChild1(t)) == TRUE)
						Evaluate(getChild2(t));
					else
						Evaluate(getChild3(t));		
				break;
				
				case WHILE:
					
					while(Evaluate(getChild1(t)) != FALSE)
						Evaluate(getChild2(t));
				break;
				
				case BOOL:
					return getValue(t);
					
		}
		return 0;
	}
