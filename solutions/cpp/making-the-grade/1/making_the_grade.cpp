#include <array>
#include <string>
#include <vector>

// Round down all provided student scores.
std::vector<int> round_down_scores(std::vector<double> student_scores) {
    std:: vector<int> rounded{};
    for (auto s : student_scores) {
        int x = static_cast<int>(s);
        rounded.emplace_back(x);
    }
    return rounded;
}


// Count the number of failing students out of the group provided.
int count_failed_students(std::vector<int> student_scores) {
    int i{0};
    for (auto s : student_scores) {
        if (s <= 40) {
            i += 1; 
        }
    }
    return i;
}

// Determine how many of the provided student scores were 'the best' based on the provided threshold.
std::vector<int> above_threshold(std::vector<int> student_scores, int threshold) {
    std::vector<int> above{};
    for (auto s : student_scores) {
        if (s >= threshold) {
            above.emplace_back(s);
        }
    }
    return above;
}

// Create a list of grade thresholds based on the provided highest grade.
std::array<int, 4> letter_grades(int highest_score) {
    double scaled{(static_cast<double>(highest_score)-40)/4};
    int scale = static_cast<int>(scaled);
    std::array<int,4> intervals {41, 41 + scale, 41 + 2 * scale, 41 + 3 * scale};
    return intervals;
}

// Organize the student's rank, name, and grade information in ascending order.
std::vector<std::string> student_ranking(std::vector<int> student_scores, std::vector<std::string> student_names) {
    std::vector<std::string> result{};
    for (int i{0}; i < student_scores.size(); ++i) {
        // used to_string as these can be 2 digit numbers
        // so char is not ideal
        result.emplace_back(std::to_string(i+1) + ". " + student_names[i] + ": " + std::to_string(student_scores[i]));
    }
    return result;
}

// Create a string that contains the name of the first student to make a perfect score on the exam.
std::string perfect_score(std::vector<int> student_scores, std::vector<std::string> student_names) {
    std::vector<std::string> result{};
    for (int i{0}; i < student_scores.size(); ++i) {
        if (student_scores[i] == 100) {
            return student_names[i];
        }
    }
    return "";
}
