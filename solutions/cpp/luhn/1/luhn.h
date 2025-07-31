#if !defined(LUHN_H)
#define LUHN_H
#include <string>

namespace luhn {
    std::string trunc(std::string str);
    int subn(int num);
    std::string doubledigit(std::string num);
    std::string check(std::string str); 
    std::string oddp(std::string num);
    std::string evenp(std::string num);
    bool valid(std::string num);
}  // namespace luhn

#endif // LUHN_H