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
    freopen ("Q3.txt", "r", stdin);
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
    vector<int> tt(n);
    while(pq.size() || index < n) {
        if(pq.size() == 0) {
            pq.push(ord[index++]);
            continue;
        }
        //cout << now << " " << index << endl;
        if(index < n) {
            if(now + pq.top().b_t < ord[index].a_t) { // 現在的 process 先結束
                now += pq.top().b_t;
                tt[pq.top().tag] = now;
                pq.pop();
            } else { // 有新的 process 進來
                if(ord[index].b_t < pq.top().b_t - (ord[index].a_t - now)) { // 舊的 process 要被換掉
                    ORD tmp = pq.top();
                    tmp.b_t -= ord[index].a_t - now;
                    pq.pop();
                    pq.push(tmp);
                    now = ord[index].a_t;
                }
                pq.push(ord[index++]);
            }
        } else {
            now += pq.top().b_t;
            tt[pq.top().tag] = now;
            pq.pop();
        }
    }
    double awt = 0, att = 0;
    printf("%s\t%20s\t%15s", "Process", "Waiting Time", "Turnaround Time\n");
    for(int i = 0; i < n; ++i) {
        int turn = tt[i] - a_t[i];
        int wait = turn - b_t[i];
        awt += (double)wait / n;
        att += (double)turn / n;
        printf("P[%d]\t\t%d\t\t%d\n", i+1, wait, turn);
    }
    printf("\n");
    printf("Average waiting time : %f\n", awt);
    printf("Average turnaround time : %f\n", att);
    return 0;
}
