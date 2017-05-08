#include <iostream>
#include <cstdio>
#include <algorithm>
using namespace std;

int v[100010];
char line[1000010];

char readchar(){
    static const int bufsize = 1<<16;
    static char buf[bufsize], *p=buf, *e=buf;
    return (p==e && (e=(p=buf)+fread(buf,1,bufsize,stdin),p==e)?0:*p++);
}

int main()
{
    freopen ("input2.txt","r",stdin);
    //freopen ("output.txt","w",stdout);
    int n;
    scanf("%d", &n);
    //getchar();
    while(true) {
        char a = readchar();
        if(a == '\n') break;
    }
    while(n--) {
        int o = 0;
        for(o = 0;; ++o) {
            line[o] = readchar();
            if(line[o] == '\n' || line[o] == EOF) break;
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
        for(int i = 0; i < ord; ++i) printf("%d ", v[i]);
        printf("\n");
        //char arr[100010];
        //int order = 0;
        //cout << "hi" << endl;
        //cout << "hi" << endl;
        //cout << "hi" << endl;
        //cout << "hi" << endl;
        //for(int i = 0; i < ord; ++i) {
            //int h = 1;
            //int k = v[i];
            //while(k) { h *= 10; k /= 10; cout << h << endl; }
            //while(v[i]) {
                //h /= 10;
                //cout << h << endl;
                //arr[order++] = (v[i]/h) + '0';
                //v[i] %= h;
            //}
            //arr[order++] = ' ';
        //}
        //for(int i = 0; i < order; ++i) putchar(arr[i]);
        //putchar('\n');
    }
    fclose (stdin);
    //fclose (stdout);
    return 0;
}
