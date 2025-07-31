#if !defined(PROTEIN_TRANSLATION_H)
#define PROTEIN_TRANSLATION_H
#include <vector>
#include <string>

namespace protein_translation {
    std::vector<std::string> prep(std::string str);
    std::string dict(std::string str);   
    std::vector<std::string> proteins(std::string str);
}  // namespace protein_translation

#endif // PROTEIN_TRANSLATION_H
