#include <iostream>
#include <sstream>
#include <fstream>
#include <vector>
using namespace std;

bool f_used = false;
int dp[10010][10010][5];
vector<string> TYPE;
vector<int> COST, ATTA;
int n, m;
int F = 5;

int DP(int index, int cost, int f_cnt)
{
    //cout << index << " " << cost << " " << f_cnt << endl;
    if(cost < 0) return -1e8;
    if(f_cnt < 0) return -1e8;
    if(index < 0) return 0;
    if(dp[index][cost][f_cnt]) return dp[index][cost][f_cnt];
    if(TYPE[index] == "follower" && f_cnt == 4) {
        dp[index][cost][f_cnt] = max(DP(index-1, cost, f_cnt), DP(index-1, cost-COST[index], f_cnt-1)+ATTA[index]+2);
    } else if(TYPE[index] == "follower") {
        dp[index][cost][f_cnt] = max(DP(index-1, cost, f_cnt), DP(index-1, cost-COST[index], f_cnt-1)+ATTA[index]);
    } else {
        dp[index][cost][f_cnt] = max(DP(index-1, cost, f_cnt), DP(index-1, cost-COST[index], f_cnt)+ATTA[index]);
    }
    //cout << index << " | " << cost << " | " << f_cnt << " | " << dp[index][cost][f_cnt] << endl;
    return dp[index][cost][f_cnt];
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
        //cout << "===========" << endl;
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
            for(int j = 0; j < n; ++j) {
                for(int k = 0; k < 5; ++k)
                    dp[i][j][k] = 0;
            }
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
        DP(n-1, m, 4);
        cout << dp[n-1][m][4] << endl;
    }
    is.close();
    delete[] buffer;
    return 0;
}

