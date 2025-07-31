#if !defined(ALLERGIES_H)
#define ALLERGIES_H
#include <vector>
#include <array>
#include <string>
#include <unordered_set>

namespace allergies {
class allergy_test {
    public:
    std::array<std::string,8> list{"cats","pollen","chocolate","tomatoes","strawberries","shellfish","peanuts","eggs"};
    int test{};

    allergy_test(int x){
        test = x;
    }
    
    // function that converts number to
    // binary representation in array
    // no larger than 8 digits
    std::vector<int> binary(int x) {
        std::vector<int> bin{};
        int mod{2};
        
        while(x > 0) {
        bin.insert(bin.begin(), x % 2);
        x /= mod;
        }
        // if the previous loop ends 
        // before 8 digits, stuff in 0s
        while (bin.size() < 8) {
            bin.insert(bin.begin(), 0);
        }
        // if the previous loop ends 
        // with more than 8 digits 
        // remove things after 8 digits
        while (bin.size() > 8) {
            bin.erase(bin.begin());
        }
        return bin;
    }

    // convert string to index
    int dict(std::string a) {
        int j{0};
        for(int i{0}; i < 8; ++i){
            if(list[i] == a) {j = i;}
        }
        return j;
    }

    bool is_allergic_to(std::string a) {
        int j{dict(a)};
        return binary(test)[j];
    }

    std::unordered_set<std::string> get_allergies() {
        std::unordered_set<std::string> result{};
        for(int i{0}; i < 8; ++i) {
            if (binary(test)[i] == 1) {
                result.emplace(list[i]);
            }
        }
        return result;
    }
    };
}  // namespace allergies

#endif // ALLERGIES_H