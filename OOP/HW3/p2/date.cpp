/*************************************************************************
	> File Name: date.cpp
	> Author: Gavin Lee
	> School: National Chiao Tung University
	> Team: NCTU_Ragnorok
	> Mail: sz110010@gmail.com
	> Created Time: Sun 03 Apr 2016 07:21:24 PM CST
 ************************************************************************/

#include <bits/stdc++.h>
#include "date.h"
using namespace std;

//get_funcs
unsigned short int Date::getDate_data()const { return Date_data; }
unsigned short int Date::getDay()const { return Date_data & 31; }
unsigned short int Date::getMon()const { return (Date_data>>5) & 15; }
unsigned short int Date::getYr()const { return (Date_data>>9)+2000; }

//set_funcs
void Date::setDate(const short int &y,const short int &m,const short int &d)
{
    Date_data = y-2000;
    Date_data <<= 4;
    Date_data += m;
    Date_data <<= 5;
    Date_data += d;
    return;
}

void Date::showDate() { cout << getYr() << ' ' << getMon() << ' ' << getDay() << endl; return; }
