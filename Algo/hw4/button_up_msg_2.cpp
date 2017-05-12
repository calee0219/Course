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
        int dp[10010][6] = {{}};
        int f_num[10010] = {};
        for(int i = 0; i < n; ++i) {
            for(int j = m; j-COST[i] >= 0; --j) {
                for(int k = 0; k < 5; ++k) {
                    if(TYPE[i] == "follower") {
                        if(k == 0)
                            dp[j][k] = max(dp[j][k], dp[j-COST[i]][k+1]+ATTA[i]+2);
                        else if(k < 5)
                            dp[j][k] = max(dp[j][k], dp[j-COST[i]][k+1]+ATTA[i]);
                        else
                            dp[j][k] = dp[j][k];
                    } else {
                        dp[j][k] = max(dp[j][k], dp[j-COST[i]][k]+ATTA[i]);
                    }
                }
                //cout << j << " | " << dp[j] << endl;
            }
        }
        cout << max(dp[m][0],max(dp[m][1],max(dp[m][2],max(dp[m][3],dp[m][4])))) << endl;
    }
    return 0;
}

