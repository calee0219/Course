#include <iostream>
#include "MyStack.h"
using namespace std;

int main(void) {
    MyStack<char> stack;
    char input;
    char *value[5];

    for(int i=0; i<5; i++) {
        cin >> input;
        value[i] = new char(input);
        stack.push(*value[i]);
    }
    cout << endl;
    while( !stack.empty() ) {
        cout << stack.top() << endl;
        stack.pop();
    }
    for(int i=0; i<5; i++)
        delete value[i];
    
    return 0;
}
