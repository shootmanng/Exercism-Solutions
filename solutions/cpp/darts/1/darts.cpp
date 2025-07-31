#include "darts.h"
#include <cmath>
namespace darts {
double score(double x, double y) {
    if (pow(x,2) + pow(y,2) <= 100 && pow(x,2) + pow(y,2) > 25) {
        return 1;
    } else if (pow(x,2) + pow(y,2) <= 25 && pow(x,2) + pow(y,2) > 1) {
        return 5;
    } else if (pow(x,2) + pow(y,2) <= 1) {
        return 10;
    } else {
        return 0;
    }
}
} // namespace darts