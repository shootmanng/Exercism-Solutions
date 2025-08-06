def rotate(text, key):
    letters = "abcdefghijklmnopqrstuvwxyz"
    caps = letters.upper()
    result = ""
    
    for i in range(len(text)):
        if text[i] in letters:
            result += letters[(letters.index(text[i]) + key) % 26]
        elif text[i] in caps:
            result += caps[(caps.index(text[i]) + key) % 26]
        else:
            result += text[i]

    return result