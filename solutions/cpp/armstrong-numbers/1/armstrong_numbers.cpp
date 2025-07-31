#include "armstrong_numbers.h"

namespace armstrong_numbers {
    bool is_armstrong_number(int num) {
        double sum{};
        std::string snum{std::to_string(num)};
        double power{static_cast<double>(snum.length())};
        for (auto ch : snum) {
            sum += pow(static_cast<double>(ch - '0'),power);
        }
        if (sum == num) {return true;}
        else {return false;}
    }
}  // namespace armstrong_numbers
