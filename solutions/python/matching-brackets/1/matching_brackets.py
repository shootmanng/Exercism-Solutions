def closing(ch):
    if ch == '}': 
        return '{'
    if ch == ')': 
        return '('
    if ch == ']': 
        return '['
        
def is_paired(input_string):
    new_string = "".join([x for x in input_string if x in '{[(]})'])
    
    if '{' in input_string and '}' in input_string:
        if input_string.index("}") < input_string.index("{"):
            return False
    if '(' in input_string and ')' in input_string:
        if input_string.index(")") < input_string.index("("):
            return False
    if '[' in input_string and ']' in input_string:
        if input_string.index("]") < input_string.index("["):
            return False
    
    if input_string.count('[') != input_string.count(']'):
        return False
    if input_string.count('(') != input_string.count(')'):
        return False
    if input_string.count('{') != input_string.count('}'):
            return False
        
    length = len(new_string)
    for i in range(length - 2):
        print(new_string[i:(i+1)] == closing(new_string[(i + 1): (i+2)]))
        if new_string[i:(i+1)] == closing(new_string[(i + 1): (i+2)]):
            new_string = new_string[:i] + new_string[(i+2):]
    
    left = [x for x in new_string if x in '{([']
    right = [x for x in new_string if x in '})]']
    check = []
    
    for ch in right:
        check.append(closing(ch))
    check = list(reversed(check))
    return left == check