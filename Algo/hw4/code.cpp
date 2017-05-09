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
        int n = (int)*offset++;
        int m = (int)*offset++;
        cout << n << ' ' << m << endl;
        offset++;
        for(int i = 0; i < n; ++i) {
            int sz = (*offset++) & 31; // size of string
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

