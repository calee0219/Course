#include <fstream>
#include <algorithm>
using namespace std;

char all_file[1000010];
char output_file[1000010];
int v[1000010];
char line[1000010];

int main()
{
    fstream input, output;
    input.open("input2.txt", ios::in | ios::binary);
    input.seekg(0, ios::end);
    int file_size = input.tellg();
    int output_pt = 0;
    input.seekg(0, ios::beg);
    input.read(all_file, file_size);
    input.close();
    all_file[file_size] = '\0';
    //cout << file_size << endl;
    //cout << all_file << endl;
    int file_ord = 0;
    int n = 0;
    while(true) {
        //cout << file_ord << ' ';
        if(all_file[file_ord] >= '0' && all_file[file_ord] <= '9') {
            n *= 10;
            n += all_file[file_ord] - '0';
        }
        if(all_file[file_ord] == '\n') break;
        file_ord++;
    }
    file_ord++;
    while(n--) {
        int o = 0;
        for(o = 0; ; ++o) {
            line[o] = all_file[file_ord++];
            if(line[o] == '\n' || line[o] == '\0') break;
        }
        int tmp = 0;
        int ord = 0;
        for(int i = 0; i < o; ++i) {
            if(line[i] >= '0' && line[i] <= '9') {
                if(i > 0 && (line[i-1] < '0' || line[i-1] > '9')) {
                    v[ord++] = tmp;
                    tmp = 0;
                }
                tmp *= 10;
                tmp += line[i] - '0';
                continue;
            }
        }
        v[ord++] = tmp;
        sort(v,v+ord);
//for(int i = 0; i < ord; ++i) cout << v[i] << ' ';
//cout << endl;
        for(int i = 0; i < ord; ++i) {
            char arr[100];
            int now = 0;
            while(v[i]) {
                arr[now++] = v[i] % 10;
                v[i] /= 10;
            }
            if(v[i] == 0) output_file[output_pt++] = '0';
            for(int j = now-1; j >= 0; --j) output_file[output_pt++] = arr[j]+'0';
            output_file[output_pt++] = ' ';
//for(int j = 0; j < output_pt; ++j) cout << output_file[j];
//cout << endl;
        }
        output_file[output_pt++] = '\n';
        //for(int i = 0; i < output_pt; ++i) cout << output_file[i];
        //cout << endl;
    }
    output_file[output_pt] = '\0';
    output.open("output.txt", ios::out);
    output.seekp(0, ios::beg);
    output.write(output_file, output_pt);
    output.close();
    return 0;
}
