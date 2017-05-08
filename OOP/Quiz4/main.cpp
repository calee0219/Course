#include "figure.hpp"
#define count 5
using namespace figure;

int main(){
    BasePoint **objs=new BasePoint*[count];
    objs[0]=new BasePoint(1,2);
    objs[1]=new Figure1P(1,2,3);
    objs[2]=new Figure2P(1,2,3,4);
    objs[3]=new Square(1,2,5);
    objs[4]=new Rectangle(1,2,3,4);

    for(int i=0; i<count;i++)
        objs[i]->info();

    for(int i=0; i<count;i++)
        delete objs[i];
    delete [] objs;
}
