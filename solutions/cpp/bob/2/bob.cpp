#include "bob.h"

namespace bob {

    // normalize strings so there are only letter characters
    std::string norm(std::string str) {
        std::string result{};
        for (auto ch : str) {
            if (isalpha(ch)){
                result += ch;
            }
        }
        return result;
    }

    // remove ending whitespace
    std::string endr(std::string str) {
        while (isspace(str.back()) && str.length() != 0) {
            str.pop_back();
        }
        return str;
    }

    // if the number of caps of normed string 
    // is equal to the number of letters return true
    bool caps(std::string str) {
        std::string nstr{norm(str)};
        unsigned int i{0};
        for (auto ch : nstr) {
            if (isupper(ch) != 0) {
                i+=1;
            }
        }
        if ((i == (nstr.length())) && (i != 0)) {return true;}
        else {return false;}
    }

    // checking for silent characters
    bool silence(std::string str) {
        if (norm(str).length() != 0) {
            return false;
        } else if (str.find("\t") != std::string::npos) {
            return true;
        } else if (str.find("\n") != std::string::npos) {
            return true;
        } else if (endr(str).length() == 0) {
            return true;
        } else {return false;}
    }

    std::string hey(std::string str) {
        if (caps(str) && str.find("?") == (endr(str).length()-1)) {
            return "Calm down, I know what I'm doing!";
        } else if ((str.find("?") == (endr(str).length()-1)) && (endr(str).length() != 0)) {
            return "Sure.";
        } else if (caps(str)) {
            return "Whoa, chill out!";
        } else if (silence(str)) {
            return "Fine. Be that way!";
        }
        else {
            return "Whatever.";
        }
        return "hello";
    }
}  // namespace bob
