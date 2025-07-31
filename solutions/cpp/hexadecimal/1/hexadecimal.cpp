#include "hexadecimal.h"

namespace hexadecimal {
    int convert(std::string num) {
        int sum{0};
        for (char ch : num) {
            if ((ch < '0' || ch > '9') && (ch < 'a' || ch > 'f')) {
                return 0;
            }
            if (ch == 'a') {
                sum = 16 * sum + 10;
            } else if (ch == 'b') {
                sum = 16 * sum + 11;
            } else if (ch == 'c') {
                sum = 16 * sum + 12;
            } else if (ch == 'd') {
                sum = 16 * sum + 13;
            } else if (ch == 'e') {
                sum = 16 * sum + 14;
            } else if (ch == 'f') {
                sum = 16 * sum + 15;
            } else {
                sum = 16 * sum + (ch-'0');
            }
        }
        return sum;
    }
}  // namespace hexadecimal
