#include <iostream>
#include "BigNum.h"
using namespace std;

int main(){
    BigNum a, b, c;

    cin >> a;

    b=++a;
    cout << a << endl;
    cout << b << endl;

    c=a++;
    cout << a << endl;
    cout << c << endl;
}


