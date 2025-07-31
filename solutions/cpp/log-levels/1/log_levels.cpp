#include <string>

namespace log_line {
    std::string message(std::string log) {
        std::string::size_type index{log.find(":")+2};
        return log.substr(index);
        }
    std::string log_level(std::string log) {
        std::string::size_type index{log.find(":")};
        return log.substr(1,index-2);
    }
    std::string reformat(std::string log) { 
        return message(log) + " (" + log_level(log) + ")";
     }
} // namespace log_line
