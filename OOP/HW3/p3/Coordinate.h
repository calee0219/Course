#ifndef COORDINATE_H_INCLUDED
#define COORDINATE_H_INCLUDED
class Coordinate {
public:
    Coordinate(int, int);
    int getX() const;
    int getY() const;
private:
    const int x;
    const int y;
};
#endif // COORDINATE_H_INCLUDED