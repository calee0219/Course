#ifndef BIGNUM_H
#define BIGNUM_H

#include <string>
#include <iostream>
#define MAX_LENGTH 100

class BigNum{
	public:
        BigNum();
        BigNum(int const );
        BigNum(std::string const &);
        BigNum operator+(const BigNum &) const;
        BigNum operator-(const BigNum &) const;
        BigNum operator*(const BigNum &) const;
        BigNum& operator++();
        BigNum operator++(int);
        friend std::ostream &operator<<(std::ostream &,const BigNum &);
        friend std::istream &operator>>(std::istream &, BigNum &);
         
	private:
        bool overflow = 0;
        bool sign = 0;  // 0 for + and 1 for -
        int num[10] = {0};
//Add data feild here to save the data of BigNum.
//Add additional member or global functions to help you set up the class.
};

BigNum operator+(const BigNum &, const int);
BigNum operator+(const int, const BigNum &);
BigNum operator-(const BigNum &, const int);
BigNum operator-(const int, const BigNum &);
BigNum operator*(const BigNum &, const int);
BigNum operator*(const int, const BigNum &);


#endif
