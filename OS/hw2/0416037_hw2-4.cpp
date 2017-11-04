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
    freopen ("Q4.txt", "r", stdin);
    int n;
    cin >> n;
    vector<ORD> ord;
    vector<int> a_t, b_t;
    int q1, q2;
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
    cin >> q1 >> q2;
    sort(ord.begin(), ord.end(), cmp);
    //for(int i = 0; i < n; ++i) {
        //cout << ord[i].tag << " " << ord[i].a_t << " " << ord[i].b_t << endl;
    //}
    queue<ORD> l1, l2;
    priority_queue<ORD> l3;
    int now = 0;
    int index = 0;
    vector<int> ot;
    vector<int> tt(n);
    while(l1.size() || l2.size() || l3.size() || index < n) {
        //cout << now << " " << index << " " << l1.size() << " " << l2.size() << " " << l3.size() << endl;
        if(!l1.size() && !l2.size() && !l3.size()) { // now 應該要跳到下一個 process 進來
            l1.push(ord[index]);
            now = ord[index++].a_t;
        } else if(index < n && now >= ord[index].a_t) { // 有新的 process 進來
            while(index < n && now >= ord[index].a_t) {
                l1.push(ord[index++]);
            }
        } else if(l1.size()) {
            //cout << "l1 " << l1.front().tag << endl;
            ORD tmp = l1.front();
            if(tmp.b_t <= q1) {
                now += tmp.b_t;
                tt[tmp.tag] = now;
            } else {
                now += q1;
                tmp.b_t -= q1;
                l2.push(tmp);
            }
            l1.pop();
        } else if(l2.size()) {
            //cout << "l2 " << l2.front().tag << endl;
            ORD tmp = l2.front();
            if(tmp.b_t <= q2) {
                now += tmp.b_t;
                tt[tmp.tag] = now;
            } else {
                now += q2;
                tmp.b_t -= q2;
                l3.push(tmp);
            }
            l2.pop();
        } else if(l3.size()) {
            //cout << "l3 " << l3.top().tag << endl;
            ORD tmp = l3.top();
            now += tmp.b_t;
            tt[tmp.tag] = now;
            l3.pop();
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
