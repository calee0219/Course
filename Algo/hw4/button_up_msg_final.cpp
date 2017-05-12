#include <iostream>
#include <sstream>
#include <fstream>
#include <vector>
#include "msgpack.hpp"
using namespace std;

//int dp[10010][10010][5];
struct Card {
    string TYPE;
    int COST, ATTA;
    bool operator<(const Card& b)const {
        return ATTA > b.ATTA;
    }
};
//vector<string> TYPE;
//vector<int> COST, ATTA;
//int n, m;

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
        //TYPE.clear(); COST.clear(); ATTA.clear();
        vector<Card> vc;
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
            Card c;
            ss << str;
            ss >> c.TYPE;
            ss >> c.COST;
            ss >> c.ATTA;
            vc.push_back(c);
            //TYPE.push_back(str);
            //COST.push_back(cost);
            //ATTA.push_back(attack);
        }
        sort(vc.begin(), vc.end());
        //for(int i = 0; i < vc.size(); ++i) cout << vc[i].ATTA << " ";
        int dp[10010][6] = {{}};
        int f_num[10010] = {};
        for(int i = 0; i < n; ++i) {
            for(int j = m; j-vc[i].COST >= 0; --j) {
                for(int k = 5; k >= 0; --k) {
                    if(vc[i].TYPE == "follower") {
                        if(k == 5)
                            dp[j][k] = max(dp[j][k], dp[j-vc[i].COST][k-1]+vc[i].ATTA+2);
                        else if(k == 0)
                            dp[j][k] = dp[j][k];
                        else
                            dp[j][k] = max(dp[j][k], dp[j-vc[i].COST][k-1]+vc[i].ATTA);
                    } else {
                        dp[j][k] = max(dp[j][k], dp[j-vc[i].COST][k]+vc[i].ATTA);
                    }
                }
                //cout << j << " | " << dp[j] << endl;
            }
        }
        cout << dp[m][5] << endl;
    }
    return 0;
}

