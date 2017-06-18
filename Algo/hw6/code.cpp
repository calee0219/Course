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
    if(r < 0 || r > R || c < 0 || c > R) return false;
    if(GRAPH[r][c] == kind && goThrough[r][c]) return true;
    if(GRAPH[r][c] != kind) return false;
    goThrough[r][c] = true;
    if(dep > td) {
        tr = r;
        tc = c;
    }
    // up
    if(r-1 != lr)
        if(dfs(r-1, c, r, c, kind, dep+1)) return true;
    // down
    if(r+1 != lr)
        if(dfs(r+1, c, r, c, kind, dep+1)) return true;
    // left
    if(c-1 != lc)
        if(dfs(r, c-1, r, c, kind, dep+1)) return true;
    // right
    if(c+1 != lc)
        if(dfs(r, c+1, r, c, kind, dep+1)) return true;
    return false;
}

void dfs2(int r, int c, int kind, int dep) {
    if(r < 0 || r > R || c < 0 || c > R) return;
    if(go[r][c]) return;
    if(GRAPH[r][c] != kind) return;
    go[r][c] = true;
    LP[kind] = max(LP[kind], dep);
    dfs2(r-1, c, kind, dep+1);
    dfs2(r+1, c, kind, dep+1);
    dfs2(r, c-1, kind, dep+1);
    dfs2(r, c+1, kind, dep+1);
    return;
}

int main()
{
    ifstream is ("input.txt", ifstream::binary);
    ofstream os ("output.txt", ifstream::binary);
    //fstream os;
    //os.open("output.txt", std::ios::binary | std::ios::out);
    msgpack::sbuffer sbuf;
    is.seekg (0, is.end);
    int length = is.tellg();
    is.seekg (0, is.beg);
    char* buffer = new char [length];
    is.read (buffer,length);
    char* offset = buffer;
    int TIME = (int)*offset++;
    while(TIME--) {
        R = 0; C = 0;
        int T;
        char check = (char)*offset++;
        if((int)check == 0xcd) {
            R = (int)*offset++;
            R <<= 8;
            R += (int)*offset++;
        } else if((int)check == 0xcc) {
            R = (int)*offset++;
        } else if((int)check == 0xd0) {
            R = (int)*offset++;
        } else if((int)check == 0xd1) {
            R = (int)*offset++;
            R <<= 8;
            R += (int)*offset++;
        } else {
            R = (int)check;
        }
        check = (char)*offset++;
        if((int)check == 0xcd) {
            C = (int)*offset++;
            C <<= 8;
            C += (int)*offset++;
        } else if((int)check == 0xcc) {
            C = (int)*offset++;
        } else if((int)check == 0xd0) {
            C = (int)*offset++;
        } else if((int)check == 0xd1) {
            C = (int)*offset++;
            C <<= 8;
            C += (int)*offset++;
        } else {
            C = (int)check;
        }
        check = (char)*offset++;
        if((int)check == 0xcd) {
            T = (int)*offset++;
            T <<= 8;
            T += (int)*offset++;
        } else if((int)check == 0xcc) {
            T = (int)*offset++;
        } else if((int)check == 0xd0) {
            T = (int)*offset++;
        } else if((int)check == 0xd1) {
            T = (int)*offset++;
            T <<= 8;
            T += (int)*offset++;
        } else if((int)check == 0xce) {
            T = (int)*offset++;
            T <<= 8;
            T += (int)*offset++;
            T <<= 8;
            T += (int)*offset++;
            T <<= 8;
            T += (int)*offset++;
        } else if((int)check == 0xd2) {
            T = (int)*offset++;
            T <<= 8;
            T += (int)*offset++;
            T <<= 8;
            T += (int)*offset++;
            T <<= 8;
            T += (int)*offset++;
        } else {
            T = (int)check;
        }
        int GS;
        check = (char)*offset++;
        if((int)check == 0xdc) {
            GS = (int)*offset++;
            GS <<= 8;
            GS += (int)*offset++;
            for(int r = 0; r < R; ++r) {
                for(int c = 0; c < C; ++c) {
                    int tmp;
                    check = (char)*offset++;
                    if((int)check == 0xcd) {
                        tmp = (int)*offset++;
                        tmp <<= 8;
                        tmp += (int)*offset++;
                    } else if((int)check == 0xcc) {
                        tmp = (int)*offset++;
                    } else if((int)check == 0xd0) {
                        tmp = (int)*offset++;
                    } else if((int)check == 0xd1) {
                        tmp = (int)*offset++;
                        tmp <<= 8;
                        tmp += (int)*offset++;
                    } else if((int)check == 0xce) {
                        tmp = (int)*offset++;
                        tmp <<= 8;
                        tmp += (int)*offset++;
                        tmp <<= 8;
                        tmp += (int)*offset++;
                        tmp <<= 8;
                        tmp += (int)*offset++;
                    } else if((int)check == 0xd2) {
                        tmp = (int)*offset++;
                        tmp <<= 8;
                        tmp += (int)*offset++;
                        tmp <<= 8;
                        tmp += (int)*offset++;
                        tmp <<= 8;
                        tmp += (int)*offset++;
                    } else {
                        tmp = (int)check;
                    }
                    GRAPH[r][c] = tmp;
                }
            }
        } else if((int)check == 0xdd) {
            GS = (int)*offset++;
            GS <<= 8;
            GS += (int)*offset++;
            GS <<= 8;
            GS += (int)*offset++;
            GS <<= 8;
            GS += (int)*offset++;
            for(int r = 0; r < R; ++r) {
                for(int c = 0; c < C; ++c) {
                    int tmp;
                    check = (char)*offset++;
                    if((int)check == 0xcd) {
                        tmp = (int)*offset++;
                        tmp <<= 8;
                        tmp += (int)*offset++;
                    } else if((int)check == 0xcc) {
                        tmp = (int)*offset++;
                    } else if((int)check == 0xd0) {
                        tmp = (int)*offset++;
                    } else if((int)check == 0xd1) {
                        tmp = (int)*offset++;
                        tmp <<= 8;
                        tmp += (int)*offset++;
                    } else if((int)check == 0xce) {
                        tmp = (int)*offset++;
                        tmp <<= 8;
                        tmp += (int)*offset++;
                        tmp <<= 8;
                        tmp += (int)*offset++;
                        tmp <<= 8;
                        tmp += (int)*offset++;
                    } else if((int)check == 0xd2) {
                        tmp = (int)*offset++;
                        tmp <<= 8;
                        tmp += (int)*offset++;
                        tmp <<= 8;
                        tmp += (int)*offset++;
                        tmp <<= 8;
                        tmp += (int)*offset++;
                    } else {
                        tmp = (int)check;
                    }
                    GRAPH[r][c] = tmp;
                }
            }
        } else {
            GS = (int)check & 15;
            for(int r = 0; r < R; ++r) {
                for(int c = 0; c < C; ++c) {
                    int tmp;
                    check = (char)*offset++;
                    if((int)check == 0xcd) {
                        tmp = (int)*offset++;
                        tmp <<= 8;
                        tmp += (int)*offset++;
                    } else if((int)check == 0xcc) {
                        tmp = (int)*offset++;
                    } else if((int)check == 0xd0) {
                        tmp = (int)*offset++;
                    } else if((int)check == 0xd1) {
                        tmp = (int)*offset++;
                        tmp <<= 8;
                        tmp += (int)*offset++;
                    } else if((int)check == 0xce) {
                        tmp = (int)*offset++;
                        tmp <<= 8;
                        tmp += (int)*offset++;
                        tmp <<= 8;
                        tmp += (int)*offset++;
                        tmp <<= 8;
                        tmp += (int)*offset++;
                    } else if((int)check == 0xd2) {
                        tmp = (int)*offset++;
                        tmp <<= 8;
                        tmp += (int)*offset++;
                        tmp <<= 8;
                        tmp += (int)*offset++;
                        tmp <<= 8;
                        tmp += (int)*offset++;
                    } else {
                        tmp = (int)check;
                    }
                    GRAPH[r][c] = tmp;
                }
            }
        }
        // set global value
        for(int r = 0; r < R; ++r) {
            for(int c = 0; c < C; ++c) {
                goThrough[r][c] = false;
                go[r][c] = false;
            }
        }
        for(int t = 0; t < T; ++t) {
            LP[t] = 0;
        }
        bool cycle = false;
        // start trivase
        for(int r = 0; r < R; ++r) {
            for(int c = 0; c < C; ++c) {
                if(!goThrough[r][c]){
                    td = 0;
                    if(dfs(r, c, r, c, GRAPH[r][c], 0)) {
                        //cout << "cycle" << endl;
                        vector<string> tv;
                        tv.push_back("cycle");
                        msgpack::pack(sbuf, tv);
                        cycle = true;
                        break;
                    } else {
                        dfs2(tr, tc, GRAPH[tr][tc], 0);
                    }
                }
            }
            if(cycle) break;
        }
        vector<string> vs;
        if(!cycle) {
            for(int t = 1; t <= T; ++t) {
                //cout << LP[t] << ' ';
                stringstream ss;
                ss << LP[t];
                string str = ss.str();
                vs.push_back(str);
            }
            //cout << vs.size() << endl;
            msgpack::pack(sbuf, vs);
        }
    }
    os.write(sbuf.data(), sbuf.size());
    os.close();
    return 0;
}