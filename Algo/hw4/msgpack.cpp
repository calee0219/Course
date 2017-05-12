#include <iostream>
#include <sstream>
#include <fstream>
#include <vector>
#include "msgpack.hpp"
using namespace std;

bool f_used = false;
int dp[110][110][5];
vector<string> TYPE;
vector<int> COST, ATTA;
int n, m;

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
    std::ifstream ifs("input.txt");
    std::string buffer((std::istreambuf_iterator<char>(ifs)),
                        std::istreambuf_iterator<char>());
    msgpack::unpacked upd;
    std::size_t offset = 0;
    msgpack::unpack(upd, buffer.data(), buffer.size(), offset);
    std::size_t count = upd.get().as<std::size_t>();
    for (std::size_t i = 0; i != count; ++i) {
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
            for(int k = 0; k < n; ++k) {
                for(int l = 0; l < 5; ++l) {
                    dp[j][k][l] = 0;
                }
            }
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
        cout << DP(n-1, m, 4) << endl;
    }
    ifs.close();
    //while(T--) {
        ////cout << "===========" << endl;
        //f_used = false;
        //TYPE.clear(); COST.clear(); ATTA.clear();
        //char check = (char)*offset++;
        //if((int)check == 0xcd) {
            //n = (int)*offset++;
            //n <<= 8;
            //n += (int)*offset++;
        //} else if((int)check == 0xcc) {
            //n = (int)*offset++;
        //} else {
            //n = (int)check;
        //}
        //check = (int)*offset++;
        //if((int)check == 0xcd) {
            //m = (int)*offset++;
            //m <<= 8;
            //m += (int)*offset++;
        //} else if((int)check == 0xcc) {
            //m = (int)*offset++;
        //} else {
            //m = (int)check;
        //}
        //if((int)*offset++ == 0xdc) {
            //offset += 2;
        //} else if((int)*offset == 0xdd) {
            //offset += 4;
        //}
        //for(int i = 0; i < n; ++i) {
            //for(int j = 0; j < n; ++j) {
                //for(int k = 0; k < 5; ++k)
                    //dp[i][j][k] = 0;
            //}
            //int sz = (*offset++) & 31; // size of string
            //string str;
            //int cost, attack, def;
            //for(int j = 0; j < sz; ++j)
                //str += (char)*offset++;
            //stringstream ss;
            //ss << str;
            //ss >> str;
            //ss >> cost;
            //ss >> attack;
            //ss >> def;
            //TYPE.push_back(str);
            //COST.push_back(cost);
            //ATTA.push_back(attack);
        //}
        //cout << DP(n-1, m, 4) << endl;
    //}
    //is.close();
    //delete[] buffer;
    return 0;
}

