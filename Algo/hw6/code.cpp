#include <iostream>
#include <fstream>
using namespace std;

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
    cout << T << endl;
    while(T--) {
        int R, C, T;
        int GRAPH[1010][1010];
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
        cout << R << ' ';
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
        cout << C << ' ';
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
        cout << T << endl;
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
        cout << "array size: " << GS << endl;
        for(int r = 0; r < R; ++r) {
            cout << "> ";
            for(int c = 0; c < C; ++c) {
                cout << GRAPH[r][c] << ' ';
            }
            cout << endl;
        }
    }
    return 0;
}