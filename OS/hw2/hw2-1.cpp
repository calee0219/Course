#include <iostream>
#include <cstdlib>
#include <cstdio>
#include <vector>
using namespace std;

int main()
{
    int n;
    cin >> n;
    vector<int> bt, tt;
    int now = 0;
    double awt = 0, att = 0;
    for(int i = 0; i < n; ++i) {
        int tmp;
        cin >> tmp;
        now += tmp;
        tt.push_back(now);
        bt.push_back(tmp);
        awt += ((double)now-tmp)/n;
        att += (double)now/n;
    }
    printf("%s\t%20s\t%15s", "Process", "Waiting Time", "Turnaround Time\n");
    for(int i = 0; i < n; ++i) {
        printf("P[%d]\t\t%d\t\t%d\n", i, tt[i] - bt[i], tt[i]);
    }
    printf("Average waiting time : %f\n", awt);
    printf("Average turnaround time : %f\n", att);
    return 0;
}
