#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int buff_num;
double max_delay;
double total_delay;
int min_cost;
vector<pair<int,int> > in_queue;
vector<pair<int,int> > ans;
class WIRE{
    public:
        double r, c;
} wire[30];

class BUFF {
    public:
        double r, c, cost, num;
    bool operator < (const BUFF &tmp) const {
        return c < tmp.c;
    }
} buff[10];

int build_circ(int node, double delay, double cost, double C)
{
    if(node == 0) {
        if(delay < max_delay && cost <= min_cost) {
            min_cost = cost;
            if(cost < min_cost) {
                total_delay = delay;
                ans = in_queue;
            } else if(delay < total_delay) {
                total_delay = delay;
                ans = in_queue;
            }
            return 1;
        }
        return 0;
    }
    if(cost > min_cost || delay > max_delay || delay > total_delay) return 0;
    C += wire[node].c;
    for(int i = 0; i <= buff_num; ++i) {
        if(i == 0) {
            bool chk = 0;
            chk = build_circ(node - 1, delay + wire[node].r * C, cost, C);
            if(chk == 1) return 1;
            continue;
        }
        in_queue.push_back(make_pair(node,buff[i].num));
        build_circ(node - 1, delay + buff[i].r * C + wire[node].r * buff[i].c, cost + buff[i].cost, buff[i].c);
        in_queue.pop_back();
    }
    return 0;
}

int main()
{
    freopen ("input.txt","r",stdin);
    freopen ("output.txt","w",stdout);
    int N = 0;
    cin >> N;
    for(int nnn = 0; nnn < N; ++nnn) {
        ans.clear();
        in_queue.clear();
        min_cost = 1e9;
        total_delay = 1e9;
        cin >> max_delay;
        int node_num = 0;
        cin >> node_num;
        for(int i = 0; i < node_num; ++i) {
            int tmp_n;
            cin >> tmp_n;
            cin >> wire[tmp_n].r >> wire[tmp_n].c;
        }
        int tmp_delay = 0, tmp_c = 0;
        for(int i = node_num; i > 0; --i) {
            tmp_c += wire[i].c;
            tmp_delay += wire[i].r * tmp_c;
        }
        cin >> buff_num;
        for(int i = 0; i < buff_num; ++i) {
            int tmp_n;
            cin >> tmp_n;
            buff[tmp_n].num = tmp_n;
            cin >> buff[tmp_n].r >> buff[tmp_n].c >> buff[tmp_n].cost;
        }
        if(tmp_delay < max_delay) {
            cout << endl;
            continue;
        }
        sort(buff, buff+buff_num);
        build_circ(node_num, 0, 0, 0);
        if(total_delay > max_delay) {
            cout << "NO SOLUTION" << endl;
        } else {
            sort(ans.begin(), ans.end());
            for(int i = 0; i < ans.size(); ++i)
                cout << ans[i].first << " " << ans[i].second << " ";
            cout << endl;
        }
    }
    return 0;
}

/*
 2 
 2000
 3
 1 44 10.61
 2 10 20
 3 10 15
 2
 1 6.12 3.5 11.5
 2 44 0.42 1.03
 
 500
 3
 1 44 10.61
 2 10 20
 3 10 15
 2
 1 6.12 3.5 11.5
 2 44 0.42 1.03
 */
