#include <string>
#include <iostream>
using namespace std;

namespace figure{
    
    //You can add member function in this class
    class BasePoint{
        public:
            BasePoint(int px, int py):x(px),y(py){}
            virtual ~BasePoint(){}
            virtual void info(){
                cout<<"figure: "<<type<<endl;
                cout<<"position x:"<<x<<" y:"<<y<<endl;
            }
        
        protected:
            int x,y;
        private:
            string type;
    }; 
    //Fill your code here
    class Figure1P:public BasePoint {
        protected:
            int p1;
        private:
            string type;
        public:
            Figure1P(int px, int py, int pp):BasePoint(px,py),p1(pp) {}
            virtual ~Figure1P(){}
            virtual void info(){
                cout << "figure: " << type << endl;
                cout << "position x:" << x << " y:" << y << endl;
                cout << "property 1: p1=" << p1 << endl;
            }
    };
    class Square:public Figure1P {
        private:
            string type="square";
        public:
            Square(int px, int py, int pp):Figure1P(px,py,pp) {}
            virtual ~Square(){}
            virtual void info(){
                cout << "figure: " << type << endl;
                cout << "position x:" << x << " y:" << y << endl;
                cout << "property 1: p1=" << p1 << endl;
                cout << "area: " << p1*p1 << endl;
            }
    };
    class Figure2P: public Figure1P {
        protected:
            int p2;
        private:
            string type;
        public:
            Figure2P(int px, int py, int pp1, int pp2):Figure1P(px,py,pp1),p2(pp2) {}
            virtual ~Figure2P(){}
            virtual void info(){
                cout << "figure: " << type << endl;
                cout << "position x:" << x << " y:" << y << endl;
                cout << "property 1: p1=" << p1 << endl;
                cout << "property 2: p2=" << p2 << endl;
            }
    };
    class Rectangle: public Figure2P {
        private:
            string type="rectangle";
        public:
            Rectangle(int px, int py, int pp1, int pp2):Figure2P(px,py,pp1,pp2) {}
            virtual ~Rectangle(){}
            virtual void info(){
                cout << "figure: " << type << endl;
                cout << "position x:" << x << " y:" << y << endl;
                cout << "property 1: p1=" << p1 << endl;
                cout << "property 2: p2=" << p2 << endl;
                cout << "area: " << p1*p2 << endl;
            }
    };
}
