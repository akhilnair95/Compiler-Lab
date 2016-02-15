struct node{
		int leaf; 
		int val;
		char op;
		struct node *l;
		struct node *r;
	};

struct node* makeNode(struct node*, struct node*, char);

int evaluate(struct node*);
