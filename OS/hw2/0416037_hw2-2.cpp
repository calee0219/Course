#include <iostream>
#include <queue>
#include <vector>
#include <utility>
using namespace std;

struct ORD {
    int tag, a_t, b_t;
    ORD(int _tag = 0, int _at = 0, int _bt = 0): tag(_tag), a_t(_at), b_t(_bt) {}
    bool operator< (const ORD & ord) const {
        return b_t == ord.b_t? a_t > ord.a_t : b_t > ord.b_t;
    }
};

bool cmp (const ORD & a, const ORD & b) {
    return a.a_t == b.a_t? a.b_t < b.b_t : a.a_t < b.a_t;
}

int main()
{
    freopen ("Q2.txt", "r", stdin);
    int n;
    cin >> n;
    vector<ORD> ord;
    vector<int> a_t, b_t;
    for(int i = 0; i < n; ++i) {
        int tmp;
        cin >> tmp;
        a_t.push_back(tmp);
        ord.push_back(ORD(i,tmp,0));
    }
    for(int i = 0; i < n; ++i) {
        int tmp;
        cin >> tmp;
        b_t.push_back(tmp);
        ord[i].b_t = tmp;
    }
    sort(ord.begin(), ord.end(), cmp);
    //for(int i = 0; i < n; ++i) {
        //cout << ord[i].tag << " " << ord[i].a_t << " " << ord[i].b_t << endl;
    //}
    priority_queue<ORD> pq;
    int now = 0;
    int index = 0;
    vector<int> ot;
    vector<int> wt(n);
    while(index < n || pq.size()) {
        if(index < n-1 && pq.size() == 0) {
            now = ord[index].a_t;
            pq.push(ord[index]);
            index++;
        }
        ORD tag = pq.top();
        pq.pop();
        wt[tag.tag] = now - tag.a_t;
        now += tag.b_t;
        while(index < n && ord[index].a_t <= now) {
            pq.push(ord[index]);
            index++;
        }
    }
    double awt = 0, att = 0;
    printf("%s\t%20s\t%15s", "Process", "Waiting Time", "Turnaround Time\n");
    for(int i = 0; i < n; ++i) {
        int wait = wt[i];
        int turn = wt[i] + b_t[i];
        awt += (double)wait / n;
        att += (double)turn / n;
        printf("P[%d]\t\t%d\t\t%d\n", i+1, wait, turn);
    }
    printf("\n");
    printf("Average waiting time : %f\n", awt);
    printf("Average turnaround time : %f\n", att);
    return 0;
}
