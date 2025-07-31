#include "raindrops.h"
#include <string>
#include <iostream>

namespace raindrops {
std::string convert(int num) {

       std::string ns{""};

       if (num % 3 == 0) {
         ns = "Pling";
       }

       if (num % 5 == 0) {
         ns = ns + "Plang";
       }

       if (num % 7 == 0) {
         ns = ns + "Plong";
       }

       if (num % 3 != 0 && num % 5 != 0 && num %7 !=0) {
         ns=std::to_string(num);
       }

       return ns;
    }
}// namespace raindrops
