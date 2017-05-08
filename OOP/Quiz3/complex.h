#ifndef COMPLEX_NUMBER_H_INCLUDED
#define COMPLEX_NUMBER_H_INCLUDED//start to define the class
class ComplexNumber {
public:
    ComplexNumber();//default constructor
    ComplexNumber(double, double); //constructor
    double getReal() const;
    double getImag() const;
    void setReal(double);
    void setImag(double);
    double Magnitude() const;//return the radius of polar coordinate.
    //return the phase of polar coordinate in degree.
    double Phase() const;
    ComplexNumber operator!(); //return the conjugate number
    ComplexNumber operator+(const ComplexNumber&);
    ComplexNumber operator-(const ComplexNumber&);
    ComplexNumber operator*(const ComplexNumber&);
    ComplexNumber operator/(const ComplexNumber&);
    void show(); //show the complex number in the form "(real,imag)"
    void polar_coordinate(); // show the polar coordinate.

private:
    double real;
    double imag;
};
#endif // end of definition of class
