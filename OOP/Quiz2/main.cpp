#include<iostream>
#include "p2.hpp"

int main()
{
	char s;
    struct Node *top=NULL;
	int num;
	while(std::cin>>s)
	{
		if(s=='i')
		{
			std::cin>>num;
			//push the node 
	        top=oop::push(top,num);
	       // std::cout<<top->num<<" ";
		}
		else if(s=='d')
		{
			//pop the node
			top=oop::pop(top);
		}
		
	}
	oop::print(top);
	return 0;
}
