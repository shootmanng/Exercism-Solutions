#include "eliuds_eggs.h"

namespace chicken_coop {

    int positions_to_quantity(int num) {
        int result{0};
        while (num!=0) {
            result += num % 2;
            num /= 2;
        }
        return result;
    }

}  // namespace chicken_coop
