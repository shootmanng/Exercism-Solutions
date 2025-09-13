import re
def answer(question):
    question = re.sub(r"[^A-Za-z0-9 -]","",question)
    parse_arr = question.split()
    if len(parse_arr) < 3:
        raise ValueError("syntax error")
        
    parse_arr = [x for x in parse_arr[2:] if x != "by"]
    operations = ["multiplied","divided","plus","minus"]

    try:
        result = int(parse_arr[0])
    except:
        raise ValueError("syntax error")
    
    for i in range(1,len(parse_arr),2):
        if parse_arr[i] not in operations and not parse_arr[i].isnumeric():
            raise ValueError("unknown operation")
        try:
            int(parse_arr[i+1])
        except:
            raise ValueError("syntax error")

        if parse_arr[i] == "plus":
            result += int(parse_arr[i+1])
        if parse_arr[i] == "minus":
            result -= int(parse_arr[i+1])
        if parse_arr[i] == "multiplied":
            result *= int(parse_arr[i+1])
        if parse_arr[i] == "divided":
            result /= int(parse_arr[i+1])
    return result