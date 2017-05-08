/*************************************************************************
	> File Name: p1.cpp
	> Author: Gavin Lee
	> Mail: sz110010@gmail.com
	> Created Time: 西元2016年03月19日 (週六) 13時23分23秒
 ************************************************************************/

#include <bits/stdc++.h>
using namespace std;

class matrix {
public:
    void scan();                            // member function for getting every elements of matrix
    void print();                           // member function for display the matrix
    int at(const int &x, const int &y);     // member function for getting matrix[x][y]
    matrix operator*(const matrix &);       // overloading * for matrix
private:
    vector<vector<int> > _e;                // _e for storage element of matrix in private
};

int main()
{
    matrix m1, m2;
    m1.scan();
    m2.scan();
    matrix ans;
    ans = m1 * m2;
    ans.print();
    return 0;
}

void matrix::scan()
{
    char str[100];
    while(cin.peek() != '\n')
    {
        if(cin.peek() == ' ')
        {
            getchar();
            continue;
        }
        vector<int> v;
        while(cin.peek() < '9' && cin.peek() > '0')
        {
            int tmp;
            cin >> tmp;
            v.push_back(tmp);
            while(cin.peek() == ' ')
                getchar();
        }
        matrix::_e.push_back(v);
        cin.getline(str,100);
    }
    cin.getline(str,100);
    return;
}

void matrix::print()
{
    if(matrix::_e.size() == 0)
    {
        cout << "null matrix" << endl;
        return;
    }
    for(unsigned int i = 0; i < matrix::_e.size(); ++i)
    {
        for(unsigned int j = 0; j < matrix::_e.at(i).size(); ++j)
            cout << matrix::_e.at(i).at(j) << ' ';
        cout << endl;
    }
    return;
}

int matrix::at(const int &x, const int &y)
{
    return matrix::_e.at(x).at(y);
}

matrix matrix::operator*(const matrix &m)
{
    matrix ans;
    if(!m._e.size() || !matrix::_e.size() || m._e.size() != matrix::_e.at(0).size())
        return ans;
    for(unsigned int i = 0; i < matrix::_e.size(); ++i)
    {
        vector<int> v;
        for(unsigned int j = 0; j < matrix::_e.at(i).size(); ++j)
        {
            vector<int> tmp;
            for(unsigned int k = 0; k < m._e.at(j).size(); ++k)
            {
                tmp.push_back(matrix::_e.at(i).at(j) * m._e.at(j).at(k));
            }
            if(v.empty())
                v = tmp;
            else
            {
                for(unsigned int k = 0; k < tmp.size(); ++k)
                    v.at(k) += tmp.at(k);
            }
        }
        ans._e.push_back(v);
    }
    return ans;
}
