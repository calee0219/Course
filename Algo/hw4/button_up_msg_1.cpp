/* 26 */
#include <iostream>
#include <sstream>
#include <fstream>
#include <vector>
#include "msgpack.hpp"
using namespace std;

//int dp[10010][10010][5];
vector<string> TYPE;
vector<int> COST, ATTA;
int n, m;

int main()
{
    freopen("output.txt", "w", stdout);
    std::ifstream ifs("input.txt");
    std::string buffer((std::istreambuf_iterator<char>(ifs)),
                        std::istreambuf_iterator<char>());
    msgpack::unpacked upd;
    std::size_t offset = 0;
    msgpack::unpack(upd, buffer.data(), buffer.size(), offset);
    std::size_t T = upd.get().as<std::size_t>();
    while(T--) {
        //cout << "===========" << endl;
        TYPE.clear(); COST.clear(); ATTA.clear();
        msgpack::unpack(upd, buffer.data(), buffer.size(), offset);
        int n;
        msgpack::object msg(upd.get());
        msg.convert(n);
        msgpack::unpack(upd, buffer.data(), buffer.size(), offset);
        int m;
        msg = upd.get();
        msg.convert(m);
        msgpack::unpack(upd, buffer.data(), buffer.size(), offset);
        vector<string> vs;
        msg = upd.get();
        msg.convert(vs);
        int sz = vs.size();
        for(int j = 0; j < sz; ++j) {
            stringstream ss(vs[j]);
            string str;
            int cost, attack, def;
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
                    int tmp = dp[j];
                    if(f_num[j] == 0)
                        dp[j] = max(dp[j], dp[j-COST[i]]+ATTA[i]+2);
                    else if(f_num[j] > 5)
                        dp[j] = dp[j];
                    else
                        dp[j] = max(dp[j], dp[j-COST[i]]+ATTA[i]);
                    if(dp[j] != tmp)
                        f_num[j]++;
                } else {
                    dp[j] = max(dp[j], dp[j-COST[i]]+ATTA[i]);
                }
                //cout << j << " | " << dp[j] << endl;
            }
        }
        cout << dp[m] << endl;
    }
    return 0;
}

