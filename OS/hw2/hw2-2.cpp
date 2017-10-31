#include <iostream>
#include <vector>
using namespace std;

int main()
{
    int n;
    cin >> n;
    vector<int> at, bt;
    for(int i = 0; i < n; ++i) {
        int tmp;
        cin >> tmp;
        at.push_back(tmp);
    }
    for(int i = 0; i < n; ++i) {
        int tmp;
        cin >> tmp;
        bt.push_back(tmp);
    }
    return 0;
}
