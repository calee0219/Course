/*************************************************************************
	> File Name: BigNum.cpp
	> Author: Gavin Lee
	> School: National Chiao Tung University
	> Team: NCTU_Ragnorok
	> Mail: sz110010@gmail.com
	> Created Time: 西元2016年04月23日 (週六) 23時11分15秒
 ************************************************************************/

#include <bits/stdc++.h>
#include "BigNum.h"
#define IOS ios_base::sync_with_stdio(0);cin.tie(0)
#define pb push_back
#define mp make_pair
#define mt make_tuple
#define ff first
#define ss second
#define EPS 1E-7
#define INF 0x7FFFFFFF
#define PI 3.1415926535897932384626433832795
#define M 100000

using namespace std;

typedef long long LL;
typedef pair<int,int> PII;
typedef pair<LL,LL> PLL;
typedef vector<int> VII;
typedef vector<LL> VLL;
typedef vector<PII> VPII;
typedef vector<PLL> VPLL;
//int dx[]={1,0,-1,0};              int dy[]={0,1,0,-1}; //4 Direction
//int dx[]={1,1,0,-1,-1,-1,0,1};    int dy[]={0,1,1,1,0,-1,-1,-1};//8 direction
//int dx[]={2,1,-1,-2,-2,-1,1,2};   int dy[]={1,2,2,1,-1,-2,-2,-1};//Knight Direction
//int dx[]={2,1,-1,-2,-1,1};        int dy[]={0,1,1,0,-1,-1}; //Hexagonal Direction

BigNum::BigNum() {}
BigNum::BigNum(int const i):sign(i&INT_MIN) { num[0] = abs(i) % M; num[1] = abs(i) / M; }
BigNum::BigNum(string const &ss)
{
    string str = ss;
    if(str.front() == '-')
    {
        sign = 1;
        str.erase(str.begin());
    }
    else if(str.front() == '+') str.erase(str.begin());
    int l = str.length();
    int ord = 0;
    while(l > 0)
    {
        int n = 0;
        for(int i = 5; i > 0; --i)
        {
            if(l-i < 0) continue;
            n *= 10;
            n += str[l-i] - '0';
        }
        num[ord] = n;
        l -= 5;
        ord++;
    }
}
BigNum BigNum::operator+(const BigNum &b) const
{
    if(sign && !b.sign)
    {
        BigNum bb = *this;
        bb.sign = 0;
        return b - bb;
    }
    if(!sign && b.sign)
    {
        BigNum bb = b;
        bb.sign = 0;
        return *this - bb;
    }
    BigNum ans;
    if(sign && b.sign) ans.sign = 1;
    int carry = 0;
    for(int i = 0; i < 10; ++i)
    {
        int tmp = num[i] + b.num[i] + carry;
        carry = tmp / M;
        ans.num[i] = tmp % M;
    }
    return ans;
}
BigNum BigNum::operator-(const BigNum &b) const
{
    if(sign && !b.sign)
    {
        BigNum bb = b;
        bb.sign = 1;
        return *this + bb;
    }
    if(!sign && b.sign)
    {
        BigNum bb = b;
        bb.sign = 0;
        return *this + bb;
    }
    BigNum ans;
    if(sign && b.sign) ans.sign = 1;
    bool this_bigger = 0;
    for(int i = 9; i >= 0; --i)
    {
        if(num[i] > b.num[i])
        {
            this_bigger = 1;
            break;
        }
        else if(num[i] < b.num[i])
            break;
        if(i == 0) return (BigNum)0;
    }
    if(this_bigger)
    {
        for(int i = 0; i < 10; ++i)
        {
            if(num[i] >= b.num[i])
                ans.num[i] += num[i] - b.num[i];
            else
            {
                if(i < 9)
                {
                    --ans.num[i+1];
                    ans.num[i] += M+num[i]-b.num[i];
                }
                else
                    ans.num[i] += M+num[i]-b.num[i];
            }
        }
    }
    else
    {
        ans.sign = !ans.sign;
        for(int i = 0; i < 10; ++i)
        {
            if(b.num[i] >= num[i])
                ans.num[i] += b.num[i] - num[i];
            else
            {
                if(i < 9)
                {
                    --ans.num[i+1];
                    ans.num[i] += M+b.num[i]-num[i];
                }
                else
                    ans.num[i] += M+b.num[i]-num[i];
            }
        }
    }
    return ans;
}
BigNum BigNum::operator*(const BigNum &b) const
{
    BigNum ans;
    ans.sign = sign^b.sign;
    for(int i = 0; i < 10; ++i)
    {
        for(int j = 0; j < 10; ++j)
        {
            if(i+j >= 10) continue;
            LL tmp = (LL)num[i] * b.num[j];
            if(i+j < 9)
                ans.num[i+j+1] += (ans.num[i+j]+tmp) / M;
            if(i+j < 10)
                ans.num[i+j] = (ans.num[i+j]+tmp) % M;
            //cout << "num[i]=" << num[i] << " b.num[j]=" << b.num[j] << " tmp=" << tmp << "|||   ";
            //for(int k = 0; k < 10; ++k)
                //cout << ans.num[k] << ' ';
            //cout << endl;
        }
    }
    return ans;
}
BigNum& BigNum::operator++()
{
    *this = *this + (BigNum)1;
    return *this;
}
BigNum BigNum::operator++(int)
{
    BigNum ans = *this;
    ++*this;
    return ans;
}
ostream &operator<<(ostream &o, const BigNum &b)
{
    bool check = 1;
    if(b.sign) o << '-';
    for(int i = 9; i >= 0; --i)
    {
        if(check && !b.num[i]) continue;
        if(check)
            o<< b.num[i];
        else
            o << right << setw(5) << b.num[i];
        check = 0;
        o.fill('0');
    }
    o.clear();
    if(check) o << 0;
    return o;
}
istream &operator>>(istream &i, BigNum &b)
{
    string str;
    i >> str;
    BigNum bb(str);
    b = bb;
    //b.sign = bb.sign;
    //for(int i = 0; i < 10; ++i)
        //b.num[i] = bb.num[i];
    return i;
}

BigNum operator+(const BigNum &b, const int i)
{
    BigNum bb(i);
    return b + bb;
}
BigNum operator+(const int i, const BigNum &b)
{
    BigNum bb(i);
    return b + bb;
}
BigNum operator-(const BigNum &b, const int i)
{
    BigNum bb(i);
    return b - bb;
}
BigNum operator-(const int i, const BigNum &b)
{
    BigNum bb(i);
    return bb - b;
}
BigNum operator*(const BigNum &b, const int i)
{
    BigNum bb = i;
    return b * bb;
}
BigNum operator*(const int i, const BigNum &b)
{
    BigNum bb(i);
    return b * bb;
}
