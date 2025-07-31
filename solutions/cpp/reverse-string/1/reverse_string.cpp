#include "reverse_string.h"

namespace reverse_string {
    std::string reverse_string(std::string str) {
        std::string result{};
        for (unsigned int i{0}; i < str.size(); ++i) {
            result += str[str.size()-i-1];
        }
        return result;
    }
}  // namespace reverse_string
