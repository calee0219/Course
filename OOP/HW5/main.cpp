#include<iostream>
#include"p1.hpp"
using namespace std;

int main()
{
	Checkout checkout;
	Candy candy("Peanut Butter Fudge",1020,0.26);	
	checkout.enterItem(&candy);
	IceCream icecream("Vanilla Ice Cream",35);
	checkout.enterItem(&icecream);
	Topping topping("Choc.ChipIce Cream",45,"Crisps",15);
	checkout.enterItem(&topping);
	Cookie cookie("Oatmeal Raisin Cookies",4,99);
	checkout.enterItem(&cookie);
	cout<<checkout<<endl;
	checkout.clear();
	return 0;
}
