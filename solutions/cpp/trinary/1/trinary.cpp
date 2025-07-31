#include "trinary.h"

namespace trinary {
    
    int to_decimal (std::string num) {
        int sum{0};
        // make sure the string only has numerals, return 0 otherwise
        try {
            std::stoi(num);
      }
        catch (const std::invalid_argument&) {
            return 0;
      }
        // make sure no entry is above 2, return 0 otherwise
        for (std::string::size_type i{0}; i < num.length(); ++i){
            if (num.substr(num.length()-1-i,1) > "2") {
                return 0;
        } else {
                sum = sum + std::stoi(num.substr(num.length()-1-i,1)) * pow(3,i);
        }
      }
        return sum;
      }
    }
  // namespace trinary
