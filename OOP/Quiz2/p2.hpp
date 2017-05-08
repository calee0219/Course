//#ifndef _oop_linking list_H

//#define _oop_linking list_H
 struct Node
{
	int num;
	Node *next;
};

namespace oop
{

	Node* push(Node *top,int n);
	Node* pop(Node *top);
	void print(Node *top );
};

//#endif
