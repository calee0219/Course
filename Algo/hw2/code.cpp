#include <iostream>
#include <fstream>
#include <string>
#include <msgpack.hpp>

char line[100010];
char v[100010];

int main()
{
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
        if(first) { first = false; continue; }
        msgpack::object obj = oh.get();
        std::vector<int> arr;
        obj.convert(arr);
        sort(arr.begin(), arr.end());
        msgpack::pack(sbuf, arr);
    }
    fout.write(sbuf.data(), sbuf.size());
    return 0;
}
