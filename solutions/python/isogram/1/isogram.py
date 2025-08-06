def is_isogram(string):
    
    string = string.lower()
    letters = string[:1]

    for c in range(1,len(string)):
        if string[c] in letters:
            return False
        if string[c].isalpha():
            letters += string[c]

    return True