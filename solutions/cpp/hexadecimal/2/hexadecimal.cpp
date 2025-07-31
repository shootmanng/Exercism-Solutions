#include "hexadecimal.h"

namespace hexadecimal {
    int convert(const std::string& num) {
        int sum{0};
        
        std::string valid{"0123456789abcdef"};
        for (char ch : num) {
            if (valid.find(ch) == std::string::npos) {
                return 0;
            } else {
                sum = 16 * sum + valid.find(ch);
            }
        
        }
        return sum;
    }
}  // namespace hexadecimal
