#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include <tuple>
#include <vector>
#include <msgpack.hpp>
using namespace std;

char line[100010];
char v[100010];

void predo(string pattern,int dp[]){
    dp[0] = 0;
    for(int i=1;i<pattern.size();i++){
        dp[i] = dp[i-1];
        while(dp[i] > 0 && pattern[dp[i]] != pattern[i]) dp[i] = dp[dp[i]-1];
        if(pattern[dp[i]] == pattern[i]) dp[i]++;
    }
}

bool KMP(string text,string pattern){
    int dp[pattern.size()];predo(pattern,dp);
    for(int i=0,match=0;i<text.size();i++){
        while(match > 0 && pattern[match] != text[i]) match = dp[match-1];
        if(pattern[match] == text[i]) match++;
        if(match == pattern.size()){
            // do something with i-pattern.size()+1
            return true;
            match = dp[match-1];
        }
    }
    return false;
}

int main()
{
    freopen("input.txt", "br", stdin);
    std::ifstream ifs("input.txt", std::ifstream::in);
    std::string buffer((std::istreambuf_iterator<char>(ifs)), std::istreambuf_iterator<char>());

    msgpack::unpacker pac;
    pac.reserve_buffer( buffer.size() );
    std::copy( buffer.begin(), buffer.end(), pac.buffer() );
    pac.buffer_consumed( buffer.size() );

    msgpack::object_handle oh;
    bool first = true;
    std::fstream fout;
    fout.open("output.txt", std::ios::binary | std::ios::out);
    msgpack::sbuffer sbuf;
    while ( pac.next(oh) ) {
        msgpack::object obj = oh.get();
        std::vector<std::string> arr;
        obj.convert(arr);
        int index = 0;
        int T = std::stoi(arr[index++]);
        vector<string> BUFF;
        while(T--) {
            string strbuff;
            std::stringstream book(arr[index++]);
            int bs;
            book >> bs;
            std::string phoneNumb[10010];
            std::string phoneName[10010];
            for(int i = 0; i < bs; ++i) {
                std::string name, phone;
                book >> name;
                book >> phone;
                phoneName[i] = name;
                phoneNumb[i] = phone;
            }
            std::stringstream query(arr[index++]);
            int qs;
            query >> qs;
            bool first_in = true;
            for(int i = 0; i < qs; ++i) {
                std::string substring;
                query >> substring;
                vector<pair<string, string> > ans;
                for(int j = 0; j < bs; ++j) {
                    if(KMP(phoneNumb[j], substring))
                        ans.push_back(make_pair(phoneNumb[j], phoneName[j]));
                }
                sort(ans.begin(), ans.end());
                int ansSz = ans.size();
                for(int i = 0; i < ansSz; ++i) {
                    if(!first_in) strbuff.append(" ");
                    first_in = false;
                    strbuff.append(ans[i].second);
                    strbuff.append(" ");
                    strbuff.append(ans[i].first);
                    //cout << ans[i].second << ' ' << ans[i].first << " ";
                }
            }
            BUFF.push_back(strbuff);
        }
        msgpack::pack(sbuf, BUFF);
    fout.write(sbuf.data(), sbuf.size());
    }
    return 0;
}
