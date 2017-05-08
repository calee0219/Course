#include <iostream>
#include "complex.h"

int main(){
	ComplexNumber p(1,1),q(1,-1),r;
	p.polar_coordinate();
	r.show();	
	r=p+q;
	r.show();
	r=!p;
	r.show();
	r=p-q;
	r.show();
	r=p*q;
	r.show();
	r=p/q;
	r.show();

	return 0;
}
