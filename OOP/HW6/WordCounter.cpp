#include <iostream>
#include <string>
#include <cctype>
#include <functional>
#include <set>
#include "AVLTree.hpp"

using namespace std;

int main() {

	AVLTree<string, size_t> Counter;
	string Buffer;

	while( cin >> Buffer ) {

		string Word;

		for(char Char: Buffer) {

			if( isalpha(Char) )
				Word += tolower(Char);

			}

		if( ! Word.empty() )
			Counter[Word]++;

		}

	AVLTree<size_t, set<string>, std::greater<size_t>> Sorter;

	for(const auto& It: Counter)
		Sorter[It.second].insert(It.first);

	for(const auto& Rank: Sorter)
		for(const auto& Word: Rank.second)
			cout << Word << ": " << Rank.first << endl;

	// TA will use Dump() to inspect the internal structure.
	Counter.Dump();

	return 0;

	}
