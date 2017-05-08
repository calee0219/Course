#include<iostream>
#include<stack>
#include<string>
int main()
{
	std::string s;
	std::stack<char> p; 
	while(std::cin>>s)
	{
	     //fill you code  
		 int l = s.length();
         for(int i = 0; i < l; ++i)
             p.push(s.at(i));
         bool re = true;
         for(int i = 0; i < l; ++i)
         {
             if(p.top() == s.at(i))
                 p.pop();
             else
             {
                 re = false;
                 break;
             }
         }
		 
		 //if the string is a palindrome 
         if(re == false)
             std::cout<<"The string is not a Palindrome"<<std::endl;
		 
		 //if the string is not a palindrome
         if(re == true)
             std::cout<<"The string is a Palindrome"<<std::endl;
		
	}
	
	
	return 0;
}
