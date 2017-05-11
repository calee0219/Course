#include <iostream>
#include <sstream>
#include <fstream>
#include <vector>
using namespace std;

bool f_used = false;
int dp[10010][10010];
vector<string> TYPE;
vector<int> COST, ATTA;
int n, m;
int F = 5;

int DP(int index, int cost)
{
    if(index <= 0 || cost <= 0) return 0;
    dp[index][cost] = max(DP(index-1, cost), DP(index-1, cost-COST[index])+ATTA[index]);
    cout << dp[index][cost] << endl;
    return dp[index][cost];
}

int main()
{
    ifstream is ("input.txt", ifstream::binary);
    is.seekg (0, is.end);
    int length = is.tellg();
    is.seekg (0, is.beg);
    char* buffer = new char [length];
    is.read (buffer,length);
    char* offset = buffer;
    int T = (int)*offset++;
    while(T--) {
        f_used = false;
        TYPE.clear(); COST.clear(); ATTA.clear();
        char check = (int)*offset++;
        if(check == 0xcd) {
            n = (int)*offset++;
            n <<= 8;
            n += (int)*offset++;
        } else if(check == 0xcc) {
            n = (int)*offset++;
        } else {
            n = check;
        }
        check = (int)*offset++;
        if(check == 0xcd) {
            m = (int)*offset++;
            m <<= 8;
            m += (int)*offset++;
        } else if(check == 0xcc) {
            m = (int)*offset++;
        } else {
            m = check;
        }
        if((int)*offset++ == 0xdc) {
            offset += 2;
        } else if((int)*offset == 0xdd) {
            offset += 4;
        }
        for(int i = 0; i < n; ++i) {
            dp[i][0] = 0; dp[i][1] = 0;
            int sz = (*offset++) & 31; // size of string
            string str;
            int cost, attack, def;
            for(int j = 0; j < sz; ++j)
                str += (char)*offset++;
            stringstream ss;
            ss << str;
            ss >> str;
            ss >> cost;
            ss >> attack;
            ss >> def;
            TYPE.push_back(str);
            COST.push_back(cost);
            ATTA.push_back(attack);
        }
        DP(n, m);
        cout << dp[n][m] << endl;
    }
    is.close();
    delete[] buffer;
    return 0;
}

