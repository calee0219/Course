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
    unsigned char c;
    while(c = *offset++) {
        cout << (void *)offset << " " << (bitset<8>)c << '|';
        if(c < 128) {
            cout << (int)c << " " << (char)c;
        } else if(c >= 0x90 && c <= 0x9f) { // array
            cout << (int)(c & 15);
            cout << " array";
        } else if(c >= 0xa0 && c <= 0xbf) { // string
            cout << (bitset<8>)c;
            //cout << (int)(c & 31);
            cout << " string";
        } else {
            cout << (char)c;
        }
        cout << endl;
    }
    is.close();
    delete[] buffer;
    return 0;
}
