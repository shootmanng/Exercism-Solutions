#include "atbash_cipher.h"

namespace atbash_cipher {
    
    // return 5 character block strings
    std::string fblock(std::string str) {
        int i{0};
        std::string result{};
        for(auto ch : str) {
            if (i % 5 == 0 && i != 0) {
                result += ' ';
                result += ch;
            } else {result += ch;}
            ++i;
        }
        return result;
    }
    // apply cipher to chars
    std::string cipher(std::string str) {
        std::string dict{"abcdefghijklmnopqrstuvwxyz"};
        std::string dict1{"0123456789"};
        std::string result{};
        for (auto ch : str) {
            // first deal with upper case with <cctype>
            // then numbers
            // ignore punctuation or other chars
            // last just lower case chars, apply cipher
            if (isupper(ch)) {
                result += dict[25-dict.find(tolower(ch))];
                } else if (dict1.find(ch) != std::string::npos){
                result += ch;
                } else if (dict.find(ch) == std::string::npos) {
                } else {result += dict[25-dict.find(ch)];}
        }
        return result;
    }
    // encode applies cipher and formats
    std::string encode(std::string str) {
        return fblock(cipher(str));
        }
    // the cipher is idempotent, so decoding is exactly the same
    // as encoding
    // only difference is you dont format the return with 
    // spaces every 5 chars
    std::string decode(std::string str) {
        return cipher(str);
    }
}  // namespace atbash_cipher
