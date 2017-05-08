#include <iostream>
#include "quiz1.hpp"

int main(){

	std::vector<float> Pa({1, 2, 3});
	std::vector<float> Pb({4, 5, 6});

	std::cout << quiz1::EuclideanDistance(Pa, Pb) << std::endl;

	return 0;

	}
