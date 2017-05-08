#include <vector>
#include <cmath>

namespace quiz1{

    template<class T>
    T EuclideanDistance(const std::vector<T>& Pa,
        const std::vector<T>& Pb){

        if( Pa.size() != Pb.size() )
            throw ":(";

        T Distance = 0;

        // Fill your code here

        for(unsigned long i = 0; i < Pa.size(); ++i)
            Distance += pow(Pa.at(i)-Pb.at(i), 2);
        Distance = sqrt(Distance);
        return Distance;

    }

}
