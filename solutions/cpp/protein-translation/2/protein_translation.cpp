#include "protein_translation.h"

namespace protein_translation {
    std::vector<std::string> prep(std::string str) {
        std::vector<std::string> result{};
        // if string length is not divisible by 3, invalid protein
        if ((str.size() % 3) != 0) {
            return result;
        }
        // divide up string by groups of 3 for codons
        for (std::string::size_type i{0}; i < str.size(); i += 3) {
            result.emplace_back(str.substr(i,3));
        }
        return result;
    }

    //dictionary
    std::string dict(std::string str){
        if (str == "AUG") {
            return "Methionine";
        } else if (str == "UUU" || str == "UUC") {
            return "Phenylalanine";
        } else if (str == "UUA" || str == "UUG") {
            return "Leucine";
        } else if (str == "UCU" || str == "UCC" || str == "UCA" || str == "UCG") {
            return "Serine";
        } else if (str == "UAU" || str == "UAC") {
            return "Tyrosine";
        } else if (str == "UGU" || str == "UGC") {
            return "Cysteine";
        } else if (str == "UGG") {
            return "Tryptophan";
        } else if (str == "UAA" || str == "UAG" || str == "UGA") {
            return "STOP";
        } else {
            return "";
        }
    }
    // get protein names
    std::vector<std::string> proteins(std::string str) {
        std::vector<std::string> codons = prep(str);
        std::vector<std::string>  result{};
        for (std::string::size_type i{0}; i < codons.size(); ++i) {
            if (dict(codons[i]) == "STOP") {
                return result;
            }
            result.emplace_back(dict(codons[i]));
        }
        return result;    
    }          
}  // namespace protein_translation
