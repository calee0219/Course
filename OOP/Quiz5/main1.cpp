#include<iostream>
#include "p1.hpp"

int main(){
	int i;	
	int num[size]={1,14,3,7,9,11,7,2,19,20};	
	sort(num);
	std::cout<<"Sorted result: ";
	for(i=0;i<size;i++){
		std::cout<<num[i]<<" ";
	}
	std::cout<<std::endl;
	return 0;
}
