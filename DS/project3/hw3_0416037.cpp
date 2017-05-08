#include <bits/stdc++.h>
using namespace std;

vector<pair<int,int> > g[1000010];          // node, cost
int ancestor[100010];                       // ancestor
priority_queue<tuple<int,int,int>, vector<tuple<int,int,int> >, greater<tuple<int,int,int> > > path;   // cost, n1, n2

int find(int n) { return (ancestor[n] == n)? n : (ancestor[n] = find(ancestor[n])); }
void UNION(int n1, int n2) { ancestor[find(n1)] = find(n2); return; };

int main()
{
    int x, y, c;
    int total_cost = 0;
    // make graph
    while(~scanf("%d%d%d", &x, &y, &c)) {
        g[x].push_back(make_pair(y,c));
        g[y].push_back(make_pair(x,c));
        path.push(make_tuple(c,x,y));
    }
    // union tree init
    for(int i = 0; i < 100010; ++i) ancestor[i] = i;
    // join
    while(path.size()) {
        if(find(get<1>(path.top())) == find(get<2>(path.top()))) {
            path.pop();
            continue;
        }
        total_cost += get<0>(path.top());
        UNION(get<1>(path.top()),get<2>(path.top()));
        cout << get<1>(path.top()) << " " << get<2>(path.top()) << " " << get<0>(path.top()) << endl;
        path.pop();
    }
    cout << total_cost << endl;
    return 0;
}
