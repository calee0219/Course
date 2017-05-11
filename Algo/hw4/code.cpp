#include <iostream>
#include <fstream>
using namespace std;

bool f_used = false;
int dp[1000010][2];
int n, m;
int F = 5;

void DP(int num)
{
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
    cout << T << endl;
    while(T--) {
        //f_used = false;
        int check = (int)*offset++;
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
        cout << n << ' ' << m << endl;
        if((int)*offset++ == 0xdc) {
            offset += 2;
        } else if((int)*offset == 0xdd) {
            offset += 4;
        }
        for(int i = 0; i < n; ++i) {
            //dp[i][0] = 0; dp[i][1] = 0;
            int sz = (*offset++) & 31; // size of string
            //if(sz == 11) {
            //} else {
            //}
            string str;
            for(int j = 0; j < sz; ++j)
                str += (char)*offset++;
            cout << str << endl;
        }
        cout << "----------" << endl;
    }
    is.close();
    delete[] buffer;
    return 0;
}

