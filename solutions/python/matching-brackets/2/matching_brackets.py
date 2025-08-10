import re
# using only regex functions
def is_paired(input_string):
    new_string = re.sub(r"[^\[\{()\}\]]","",input_string)
    n = 1
    while n != 0:
        new_string, n = re.subn(r"{}|\(\)|\[]","",new_string)
    return new_string == ""