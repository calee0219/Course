#include <iostream>
#include <cstddef>
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
    unsigned char c;
    //cout << length << endl;
    //for(int i = 0; i < length; ++i) cout << buffer[i];
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
    //while(c = *offset++) {
        //cout << (void *)offset << " " << (bitset<8>)c << '|';
        //if(c < 128) {
            //cout << (int)c << " " << (char)c;
        //} else if(c >= 0x90 && c <= 0x9f) { // array
            //cout << (int)(c & 15);
            //cout << " array";
        //} else if(c >= 0xa0 && c <= 0xbf) { // string
            //cout << (bitset<8>)c;
            ////cout << (int)(c & 31);
            //cout << " string";
        //} else {
            //cout << (char)c;
        //}
        //cout << endl;
    //}
    is.close();
    delete[] buffer;
    return 0;
}

