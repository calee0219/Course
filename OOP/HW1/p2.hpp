#include <cstdint>

namespace problem2{

	template<uintmax_t N>
	struct Fib{

		// Change this line
        constexpr static uintmax_t Value = Fib<N-1>::Value + Fib<N-2>::Value;

		static_assert(Fib<N>::Value >= Fib<N-1>::Value,
		              "Overflow!");

    };

	// Fill code here
    template<>
    struct Fib<1>{
        constexpr static uintmax_t Value = 1;
    };
    template<>
    struct Fib<2>{
        constexpr static uintmax_t Value = 1;
    };
}
