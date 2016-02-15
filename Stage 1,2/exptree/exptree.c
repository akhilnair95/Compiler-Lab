struct node* makeNode(struct node *a, struct node *b,char c){
	struct node *temp = (struct node *)malloc(sizeof(struct node));
	temp -> leaf = 0;
	temp -> op = c;
	
	temp -> l = a;
	temp -> r = b;
	
	return temp;
}

int evaluate(struct node *t){
	if(t -> leaf == 1){
			return t-> val;
		}		
		
	int value,m,n;
	
	m = evaluate(t->l);
	n = evaluate(t->r);
	
	switch(t->op){
		case '+':
			value = m+n;
			break;
		case '-':
			value = m - n;
			break;
		case '*':
			value = m * n;
			break;
		case '/':
			value = m / n;
			break;
		default:
				printf("Char error");
				exit(1);
	}
	
	t-> val = value;

	return value;
}

struct node* makeLeafNode(int n){
	struct node *temp = (struct node *)malloc(sizeof(struct node));
	temp -> val = n;
	temp -> leaf = 1;
	temp -> l = NULL;
	temp -> r = NULL;
	return temp;
}
