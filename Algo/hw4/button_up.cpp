#include <iostream>
#include <sstream>
#include <fstream>
#include <vector>
using namespace std;

//int dp[10010][10010][5];
vector<string> TYPE;
vector<int> COST, ATTA;
int n, m;

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
        TYPE.clear(); COST.clear(); ATTA.clear();
        char check = (char)*offset++;
        if((int)check == 0xcd) {
            n = (int)*offset++;
            n <<= 8;
            n += (int)*offset++;
        } else if((int)check == 0xcc) {
            n = (int)*offset++;
        } else {
            n = (int)check;
        }
        check = (int)*offset++;
        if((int)check == 0xcd) {
            m = (int)*offset++;
            m <<= 8;
            m += (int)*offset++;
        } else if((int)check == 0xcc) {
            m = (int)*offset++;
        } else {
            m = (int)check;
        }
        if((int)*offset++ == 0xdc) {
            offset += 2;
        } else if((int)*offset == 0xdd) {
            offset += 4;
        }
        for(size_t i = 0; i < n; ++i) {
            //for(size_t j = 0; j < n; ++j) {
                //for(size_t k = 0; k < 5; ++k)
                    //dp[i][j][k] = 0;
            //}
            short sz = (*offset++) & 31; // size of string
            string str;
            int cost, attack, def;
            for(size_t j = 0; j < sz; ++j)
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
        int dp[10010] = {};
        int f_num[10010] = {};
        for(int i = 0; i < n; ++i) {
            for(int j = m; j-COST[i] >= 0; --j) {
                if(TYPE[i] == "follower") {
                    f_num[j]++;
                    if(f_num[j] == 1)
                        dp[j] = max(dp[j], dp[j-COST[i]]+ATTA[i]+2);
                    else if(f_num[j] > 5)
                        dp[j] = dp[j];
                    else
                        dp[j] = max(dp[j], dp[j-COST[i]]+ATTA[i]);
                } else {
                    dp[j] = max(dp[j], dp[j-COST[i]]+ATTA[i]);
                }
                //cout << j << " | " << dp[j] << endl;
            }
        }
        cout << dp[m] << endl;
    }
    is.close();
    delete[] buffer;
    return 0;
}

