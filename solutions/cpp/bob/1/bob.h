#if !defined(BOB_H)
#define BOB_H
#include <string>
#include <cctype>

namespace bob {
    std::string norm(std::string str);
    std::string endr(std::string str);
    bool caps(std::string str);
    bool silence(std::string str);
    std::string hey(std::string str);
}  // namespace bob

#endif // BOB_H