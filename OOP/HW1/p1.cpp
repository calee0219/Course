/*************************************************************************
	> File Name: p1.cpp
	> Author: Gavin Lee
	> Mail: sz110010@gmail.com
	> Created Time: 西元2016年03月03日 (週四) 21時00分25秒
 ************************************************************************/

#include <iostream>
#include <stack>
#include <cstdio>
using namespace std;

int main()
{
    stack<int> s;
    char c;
    int tmp;
    do
    {
        c=getchar();
        switch(c) {
        case 'i':
            cin >> tmp;
            s.push(tmp);
            break;
        case '+':
            tmp = s.top();
            s.pop();
            s.top() += tmp;
            break;
        case '-':
            tmp = s.top();
            s.pop();
            s.top() -= tmp;
            break;
        case '*':
            tmp = s.top();
            s.pop();
            s.top() *= tmp;
            break;
        case '/':
            tmp = s.top();
            s.pop();
            s.top() /= tmp;
            break;
		default:
			break;
        }
    }
    while(c != '\n');
	if(!s.empty())
		cout << s.top() << endl;
	else
		cout << 0 << endl;
    return 0;
}
