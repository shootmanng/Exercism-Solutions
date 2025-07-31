#include "trinary.h"

namespace trinary {
    
    int to_decimal (std::string_view num) {
        int sum{0};
        for (auto ch:num) {
            if (ch >= '0' && ch <= '2') {
                sum = 3 * sum + (ch - '0');
            } else {
                return 0;
            }
        }
        return sum;
    }
}
  // namespace trinary
