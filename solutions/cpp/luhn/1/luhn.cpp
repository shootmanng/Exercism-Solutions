#include "luhn.h"

namespace luhn {
    
    // function that gets rid of spaces from string
    std::string trunc(std::string str) {
        std::string result{};
        for (char ch:str) {
            if (ch != ' ') {
                result += ch;
                }
            }
        return result;
        }

    // function to check if there are non-numeric characters
    std::string check(std::string str) {
        for (char ch:str) {
            if (ch < '0' || ch > '9') {
                return "failed";
                } 
            }
        return str;
        }

    // function to reduce digit mod 9
    int subn(int num) {
        if (num > 9) {
            return num - 9;
        }
        return num;
    }

    // function for odd length string to double digits
    std::string oddp(std::string num) {
        int i{0};
        std::string result{};
        for (char ch : num) {
            if (i % 2 == 1) {
                    // keep the char type so summing digits at the end is easier
                    ch = subn(2 * (ch-'0')) + '0';
                    result += ch;
                } else {
                    result += ch;
                }
            ++i;
    }
        return result;
        }
    // function for even length string to double digits
    std::string evenp(std::string num) {
        int i{0};
        std::string result{};
        for (char ch : num) {
            if (i % 2 == 0) {
                // keep the char type so summing digits at the end is easier
                ch = subn(2 * (ch-'0')) + '0';;
                result += ch;
                } else {
                    result += ch;
                }
            ++i;
            }
        return result;
    }

    // perform algorithm on string
    std::string doubledigit(std::string num) {
        std::string result{};
        if ((num.length() % 2 == 1)) {
            result = oddp(num);
            } else {
                result = evenp(num);
            }
        return result;
    }

    // test if the sum is 0 mod 10
    bool valid(std::string num) {
        // get rid of spaces
        num = trunc(num);
        int sum{0};
        std::string result{};
        // throw out if the length of the string with no spaces is less than 2
        // or has a non numeric character in it
        // otherwise perform the algorithm and sum the digits
        if ((num.length() < 2) || (check(num)=="failed")) {
            return false;
        } else {
            result = doubledigit(num);
        }
        for (char ch : result) {
            sum += (ch-'0');
        }
        if (sum % 10 == 0) {
            return true;
        } else {
            return false;
        }
    }
}  // namespace luhn
