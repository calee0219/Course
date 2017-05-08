#include<iostream>
template<class Type, int MaxSize>
class Stack{
	//variables you need.
    struct node{
        Type value;
        node *next = NULL;
    };
    node *s = NULL;
    int cnt = 0;
public:
	Stack(); //constructor of class Stack.
	void push(Type);//push function.
	Type pop();	//pop function.
	bool empty();	//return true if there has nothing in Stack.
	bool full();	//return true if Stack is full.
	void dump();	//print the items of Stack.
};

template<class Type, int MaxSize>
Stack<Type,MaxSize>::Stack() {}

template<class Type, int MaxSize>
void Stack<Type,MaxSize>::push(Type t)
{
    if(cnt == MaxSize) {std::cout << "Stack is already full." << std::endl; return;}
    node *n = new node;
    n->value = t;
    ++cnt;
    if(!cnt) s = n;
    else
    {
        n->next = s;
        s = n;
    }
    return;
}

template<class Type, int MaxSize>
Type Stack<Type,MaxSize>::pop()
{
    Type t;
    if(cnt)
    {
        node *n = s;
        s = s.next;
        delete n;
        --cnt;
    }
    return t;
}

template<class Type, int MaxSize>
bool Stack<Type,MaxSize>::empty()
{
    if(cnt == 0) return true;
    else return false;
}

template<class Type, int MaxSize>
bool Stack<Type,MaxSize>::full()
{
    if(cnt == MaxSize) return true;
    else return false;
}

template<class Type, int MaxSize>
void Stack<Type,MaxSize>::dump()
{
    node *n = s;
    for(int i = 0; i < cnt; ++i)
    {
        std::cout << n->value << ' ';
        n = n->next;
    }
    std::cout << std::endl;
    return;
}
