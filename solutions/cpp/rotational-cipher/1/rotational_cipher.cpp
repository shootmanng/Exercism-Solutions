#include "rotational_cipher.h"

namespace rotational_cipher {
    std::string rotate(std::string str, int a) {
        // just in case someone puts an input above 26
        // it still works
        a = a % 26;
        std::string dict{"abcdefghijklmnopqrstuvwxyz"};
        std::string result{};
        for (auto ch : str) {
            if (isupper(ch)) {
                result += toupper(dict[(dict.find(tolower(ch)) + a) % 26]);
            } else if (dict.find(ch) == std::string::npos) {
                result += ch;
            } else {result += dict[(dict.find(ch) + a) % 26];}
        }
        return result;
    }
}  // namespace rotational_cipher
