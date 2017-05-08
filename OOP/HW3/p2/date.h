#ifndef DATE
#define DATE
#include<iostream>

class Date{
	 unsigned short int Date_data;
public:
	//constructors
	Date():Date_data(0){};
		
	//get_funcs
	unsigned short int getDate_data()const;
	unsigned short int getDay()const;
	unsigned short int getMon()const;
	unsigned short int getYr()const;	
	
	//set_funcs
	void setDate(const short int&,const short int&,const short int&);
	
	void showDate();
};
#endif

