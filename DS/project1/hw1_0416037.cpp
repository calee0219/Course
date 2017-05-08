#include <bits/stdc++.h>
using namespace std;

char sen[1000100];
char key[1000100];
int fal[1000100];
int ans1 = 0, ans2 = 1;

int main()
{
    freopen("test3.txt","r", stdin);
    freopen("text3out.txt","w", stdout);
    char ch;
    int cnt = 0;
    while(~scanf("%c",&ch)) {
        if((ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z')) sen[cnt] = ch;
        else sen[cnt] = ' ';
        cnt++;
    }
    for(int i = 0; i < cnt; ++i) cout << sen[i];
    int keyCnt = 0;
    for(int i = 0; i < cnt; ++i) {
        if(sen[i] != ' ') key[keyCnt++] = sen[i];
        else break;
    }
    cout << endl;
    for(int i = 0; i < keyCnt; ++i) cout << key[i];
    cout << endl;
    int p = 0;
    bool sta = true;
    for(int i = 0; i < cnt; ++i) {
        cout << sen[i] << " " << key[p] << endl;
        if(sta && sen[i] == key[p]) {
            p++;
            if(p == keyCnt && sen[i+1] == ' ') ans1++;
            else if(p == keyCnt && sen[i+1] != ' ') {sta = false; p = 0;}
        } else if(sen[i] == ' ') {
            sta = true;
            p = 0;
        } else {
            sta = false;
            p = 0;
        }
    }
    cout << ans1 << endl;
    fal[0] = -1;
    for(int i = 0; i < keyCnt; ++i) {
        while(fal[i] > 0 && key[fal[i]] != key[i]) fal[i] = fal[fal[i]-1];
        if(key[fal[i]] == key[i]) fal[i]++;
    }
    //for(int i = 0; i < keyCnt; ++i) cout << fal[i];
    fclose(stdin);
    fclose(stdout);
    return 0;
}
