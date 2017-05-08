#include <iostream>
#include "BigNum.h"
using namespace std;

int main(){
    BigNum a("987654321");
    BigNum b("-987654321");
    BigNum c, d, e;
    
    cin >> c;

    cout << c << endl;
    
    cout << a + b << endl;
    cout << a - b << endl;
    cout << a * b << endl;
    
    cout << b - a << endl;
    cout << b * b << endl;
    cout << b - b << endl;
    cout << b + b << endl;

    d=++c;
    cout << c << endl;
    cout << d << endl;

    e=c++;
    cout << c << endl;
    cout << e << endl;

}

