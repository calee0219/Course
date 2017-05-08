/*************************************************************************
	> File Name: complex.cpp
	> Author: Gavin Lee
	> Mail: sz110010@gmail.com
	> Created Time: Thu 31 Mar 2016 06:42:46 PM CST
 ************************************************************************/

#include <bits/stdc++.h>
#include "complex.h"
using namespace std;

ComplexNumber::ComplexNumber() {}
ComplexNumber::ComplexNumber(double d1,double d2) { real = d1; imag = d2; }
double ComplexNumber::getReal() const { return real; }
double ComplexNumber::getImag() const { return imag; }
void ComplexNumber::setReal(double d) { real = d; }
void ComplexNumber::setImag(double d) { imag = d; }
double ComplexNumber::Magnitude() const { return sqrt(real*real+imag*imag); }
double ComplexNumber::Phase() const { return atan2(imag,real)*180/3.14159265; }
ComplexNumber ComplexNumber::operator!() { ComplexNumber ans; ans.real = real; ans.imag = -imag; return ans; }
ComplexNumber ComplexNumber::operator+(const ComplexNumber &c) { ComplexNumber ans; ans.real = real+c.real; ans.imag = imag+c.imag; return ans; }
ComplexNumber ComplexNumber::operator-(const ComplexNumber &c) { ComplexNumber ans; ans.real = real-c.real; ans.imag = imag-c.imag; return ans; }
ComplexNumber ComplexNumber::operator*(const ComplexNumber &c)
{
    ComplexNumber ans;
    ans.real = real*c.real - imag*c.imag;
    ans.imag = imag*c.real + real*c.imag;
    return ans;
}
ComplexNumber ComplexNumber::operator/(const ComplexNumber &c)
{
    ComplexNumber ans;
    double l = Magnitude() / c.Magnitude();
    double a = Phase() - c.Phase();
    ans.real = l*cos(a*3.14159265/180);
    ans.imag = l*sin(a*3.14159265/180);
    return ans;
}
void ComplexNumber::show() { cout << '(' << real << ',' << imag << ')' << endl; }
void ComplexNumber::polar_coordinate()
{
    cout << Magnitude() << " and " << Phase() << " degree" << endl;
}

