#include <iostream>
#include <string>
#include "oop_string.h"

using namespace std;

int main(int argc , char *argv[]){
  string input_line;
  while( getline( cin, input_line).eof() == false ){
    oop::trim(input_line);
    oop::reverse(input_line);
    oop::toUpperCase(input_line);
    cout << input_line << endl;
  }
  return 0;
}

