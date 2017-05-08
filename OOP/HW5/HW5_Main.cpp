#include<iostream>
#include"p1.hpp"
using namespace std;

int main()
{
	Checkout checkout;
	
	Candy candy("milk caramel",680,0.3);	
	checkout.enterItem(&candy);
	IceCream icecream("Strawberry Ice Cream",40);
	checkout.enterItem(&icecream);
	Topping topping("Vanilla Cream",35,"Crisps",10);
	checkout.enterItem(&topping);
	Cookie cookie("Oreo",4,50);
	checkout.enterItem(&cookie);
	cout<<checkout<<endl;
	checkout.clear();
//-----------
	Candy candy1("milk caramel",680,0.3);	
	checkout.enterItem(&candy1);
	Topping topping1("Vanilla Cream",35,"Crisps",10);
	checkout.enterItem(&topping1);
	Cookie cookie1("Oreo",4,50);
	checkout.enterItem(&cookie1);
	checkout.removeItem(&topping1);
	cout<<checkout<<endl;
	checkout.clear();
	return 0;
}
