#include <iostream>
#include <fstream>
#include <vector>
#include <sstream>
#include "msgpack.hpp"
using namespace std;

bool goThrough[1010][1010];
bool go[1010][1010];
int GRAPH[1010][1010];
int LP[1010];
int R, C;
int tr, tc, td;

bool dfs(int r, int c, int lr, int lc, int kind, int dep) {
    if(LP[kind] == -1) return true;
    if(r < 0 || r >= R || c < 0 || c >= C) return false;
    if(GRAPH[r][c] == kind && goThrough[r][c]) return true;
    if(GRAPH[r][c] != kind) return false;
    goThrough[r][c] = true;
    if(dep >= td) {
        td = dep;
        tr = r;
        tc = c;
    }
    // up
    if(r-1 != lr) {
        if(dfs(r-1, c, r, c, kind, dep+1)) return true;
    }
    // down
    if(r+1 != lr) {
        if(dfs(r+1, c, r, c, kind, dep+1)) return true;
    }
    // left
    if(c-1 != lc) {
        if(dfs(r, c-1, r, c, kind, dep+1)) return true;
    }
    // right
    if(c+1 != lc) {
        if(dfs(r, c+1, r, c, kind, dep+1)) return true;
    }
    return false;
}

void dfs2(int r, int c, int lr, int lc, int kind, int dep) {
    if(r < 0 || r >= R || c < 0 || c >= C) return;
    if(go[r][c]) return;
    if(GRAPH[r][c] != kind) return;
    go[r][c] = true;
    LP[kind] = max(LP[kind], dep);
    if(r-1 != lr) dfs2(r-1, c, r, c, kind, dep+1);
    if(r+1 != lr) dfs2(r+1, c, r, c, kind, dep+1);
    if(c-1 != lc) dfs2(r, c-1, r, c, kind, dep+1);
    if(c+1 != lc) dfs2(r, c+1, r, c, kind, dep+1);
    return;
}

int main()
{
    ifstream is ("input.txt", ifstream::binary);
    ofstream os ("output.txt", ifstream::binary);
    msgpack::sbuffer sbuf;
    std::string buffer((std::istreambuf_iterator<char>(is)),
            std::istreambuf_iterator<char>());
    msgpack::unpacked upd;
    std::size_t offset = 0;
    msgpack::unpack(upd, buffer.data(), buffer.size(), offset);
    std::size_t TIME = upd.get().as<std::size_t>();
    //cout << TIME << endl;
    while(TIME--) {
        R = 0; C = 0;
        int T;
        msgpack::unpack(upd, buffer.data(), buffer.size(), offset);
        msgpack::object msg(upd.get());
        msg.convert(R);
        //cout << R << ' ';
        msgpack::unpack(upd, buffer.data(), buffer.size(), offset);
        msg = upd.get();
        msg.convert(C);
        //cout << C << ' ';
        msgpack::unpack(upd, buffer.data(), buffer.size(), offset);
        msg = upd.get();
        msg.convert(T);
        //cout << T << endl;
        vector<int> VG;
        msgpack::unpack(upd, buffer.data(), buffer.size(), offset);
        msg = upd.get();
        msg.convert(VG);
        for(int r = 0; r < R; ++r) {
            for(int c = 0; c < C; ++c ) {
                GRAPH[r][c] = VG[r*C+c];
            }
        }
        // set global value
        for(int r = 0; r < R; ++r) {
            for(int c = 0; c < C; ++c) {
                goThrough[r][c] = false;
                go[r][c] = false;
            }
        }
        for(int t = 1; t <= T; ++t) {
            LP[t] = 0;
        }
        // start trivase
        for(int r = 0; r < R; ++r) {
            for(int c = 0; c < C; ++c) {
                if(!goThrough[r][c] && GRAPH[r][c] != -1){
                    td = 0;
                    tr = r;
                    tc = c;
                    if(dfs(r, c, r, c, GRAPH[r][c], 0)) {
                        LP[GRAPH[r][c]] = -1;
                    } else {
                        dfs2(tr, tc, tr, tc, GRAPH[tr][tc], 0);
                    }
                }
            }
        }
        vector<string> vs;
        for(int t = 1; t <= T; ++t) {
            //cout << LP[t] << ' ';
            if(LP[t] == -1) {
                vs.push_back("cycle");
            } else {
                stringstream ss;
                ss << LP[t];
                string str = ss.str();
                vs.push_back(str);
            }
        }
        //cout << vs.size() << endl;
        msgpack::pack(sbuf, vs);
    }
    os.write(sbuf.data(), sbuf.size());
    os.close();
    return 0;
}