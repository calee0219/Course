/*************************************************************************
	> File Name: p3.cpp
	> Author: Gavin Lee
	> Mail: sz110010@gmail.com
	> Created Time: 西元2016年03月23日 (週三) 02時45分25秒
 ************************************************************************/

#include <bits/stdc++.h>
using namespace std;

int main()
{
    map<string,int> food;
    int m, n;
    cin >> m >> n;
    for(int i = 0; i < m; ++i)
    {
        string str;
        int price;
        cin >> str >> price;
        food.insert(make_pair(str,price));
    }
    for(int i = 0; i < n; ++i)
    {
        string str;
        int cost = 0;
        while(cin >> str && str != ".")
        {
            if(food.count(str))
                cost += food.at(str);
        }
        cout << cost << endl;
    }
    return 0;
}
