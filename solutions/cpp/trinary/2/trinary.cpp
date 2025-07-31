#include "trinary.h"

namespace trinary {
    
    int to_decimal (const std::string &num) {
        int sum{0};
        int i{0};
        for (char ch:num) {
            if (ch >= '0' && ch <= '2') {
                sum = sum + (ch - '0') * pow(3, num.length() - 1 - i);
            } else {
                return 0;
            }
            ++i;
        }
        return sum;
    }
}
  // namespace trinary
