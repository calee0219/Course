#include"date.h"
#include<iostream>

int main(){
	short int yr,mon,day;

	//construct data
	Date date;
	std::cin>>yr>>mon>>day;
	date.setDate(yr,mon,day);
	
	std::cout<<date.getDate_data()<<std::endl;
	date.showDate();

	return 0;
}

