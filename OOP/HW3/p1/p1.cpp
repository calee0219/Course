/*************************************************************************
	> File Name: p1.cpp
	> Author: Gavin Lee
	> School: National Chiao Tung University
	> Team: NCTU_Ragnorok
	> Mail: sz110010@gmail.com
	> Created Time: Sun 03 Apr 2016 07:38:17 PM CST
 ************************************************************************/

#include <bits/stdc++.h>
using namespace std;

void num_to_str(int,int);

int main()
{
    long long int num;
    while(true)
    {
        cin >> num;
        if(cin.good())
        {
            num_to_str(num,16);
            cout << ' ';
            num_to_str(num,8);
            cout << endl;
        }
        else if(cin.eof())
            break;
        else
        {
            cout << "not a number!" << endl;
            cin.clear();
            char str[100];
            cin.getline(str,100);
            continue;
        }
    }
    return 0;
}

void num_to_str(int num, int len)
{
    vector<char> v;
    while(num)
    {
        int tmp = num%len;
        v.push_back(tmp < 10? tmp+'0':tmp-10+'a');
        num /= len;
    }
    while(!v.empty())
    {
        cout << v.back();
        v.pop_back();
    }
    return;
}
