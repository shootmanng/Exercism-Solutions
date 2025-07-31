#if !defined(ATBASH_CIPHER_H)
#define ATBASH_CIPHER_H
#include <vector>
#include <string>
#include <cctype>

namespace atbash_cipher {
    std::string delstr(std::string str);
    std::string fblock(std::string str);
    std::string cipher(std::string str);
    std::string encode(std::string str);
    std::string decode(std::string str);
}  // namespace atbash_cipher

#endif // ATBASH_CIPHER_H