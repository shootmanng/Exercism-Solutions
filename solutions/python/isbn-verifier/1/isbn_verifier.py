import re

def is_valid(isbn):
    isbn = re.sub("-","",isbn)
    result = 0

    # False if letter other than X included or not the right length
    if (re.search(r"[A-WYZa-wyz]",isbn) is not None) or (len(isbn) != 10):
        return False
    # False if X is not on the end if present
    if re.search(r"X",isbn) is not None and isbn[9] != "X":
        return False
    # Formula that replaces X with 10 if necessary
    for i in range(10):
        result += (10 if isbn[i] == "X" else int(isbn[i])) * (i + 1)

    return result % 11 == 0