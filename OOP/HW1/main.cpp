#include <iostream>
#include <cstdint>
#include "p2.hpp"

int main(){

	constexpr uintmax_t N = 10;

	// It should output 55.
	std::cout << "fib(" << N << ") = "
	          << problem2::Fib<N>::Value << std::endl;

	return 0;

	}
