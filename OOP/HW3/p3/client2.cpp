#include <iostream>
#include "MyStack.h"
#include "Coordinate.h"
using namespace std;

int main(void) {
    MyStack<Coordinate> stack;
    int input1, input2;
    Coordinate *cord[5];

    for(int i=0; i<5; i++) {
        cin >> input1 >> input2;
        cord[i] = new Coordinate(input1, input2);
        stack.push(*cord[i]);
    }
    cout << endl;
    while( !stack.empty() ) {
        cout << stack.top().getX() << ' ' << stack.top().getY() << endl;
        stack.pop();
    }
    for(int i=0; i<5; i++)
        delete cord[i];

    return 0;
}
