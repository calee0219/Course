#include "p2.hpp"
#include <iostream>

namespace oop{

	Node* push(Node *top,int n){
        if(top == NULL)
        {
            top = new(Node);
            top->num = n;
            top->next = NULL;
            return top;
        }
        Node *t = top;
        while(t->next != NULL)
            t = t->next;
        Node* tmp = new(Node);
        tmp->num = n;
        tmp->next = NULL;
        t->next = tmp;
        return top;
	}
    Node* pop(Node *top){
        Node* t = top;
        if(t == NULL)
            return top;
        while(t->next != NULL && t->next->next != NULL)
            t = t->next;
        delete(t->next);
        t->next = NULL;
        return top;
	}
    void print(Node *top ){ 
     //Output specification: top->space->top->space->¡K¡K 
     //std::cout<<top<<" "; //show example
        if(top != NULL)
            oop::print(top->next);
        else
            return;
        std::cout << top->num << " ";
        return;
    } 
}
