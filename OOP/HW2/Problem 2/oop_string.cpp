#include"oop_string.h"
#include<algorithm>
#include<functional>

namespace oop{
  void reverse( std::string &str){
      unsigned int len = str.length();
      std::string s = str;
      for(unsigned int i = 0; i < len; ++i)
          str.at(i) = s.at(len-i-1);
      return;
  }

  void toUpperCase( std::string &str){
      for(unsigned int i = 0; i < str.length(); ++i)
          if(str.at(i) <= 'z' && str.at(i) >= 'a')
              str.at(i) += ('A' - 'a');
      return;
  }
  
  void trim( std::string &str){
      while(str.at(0) == ' ')
          str.erase(str.begin());
      oop::reverse(str);
      while(str.at(0) == ' ')
          str.erase(str.begin());
      oop::reverse(str);
      return;
  }
}
