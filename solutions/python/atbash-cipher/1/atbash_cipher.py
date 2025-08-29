import re
enc = {
        "a" : "z",
        "b" : "y",
        "c" : "x",
        "d" : "w",
        "e" : "v",
        "f" : "u",
        "g" : "t",
        "h" : "s",
        "i" : "r",
        "j" : "q",
        "k" : "p",
        "l" : "o",
        "m" : "n",
        "n" : "m",
        "o" : "l",
        "p" : "k",
        "q" : "j",
        "r" : "i",
        "s" : "h",
        "t" : "g",
        "u" : "f",
        "v" : "e",
        "w" : "d",
        "x" : "c",
        "y" : "b",
        "z" : "a"
    }

def encode(plain_text):
    plain_text = plain_text.lower()
    plain_text = re.sub(r"[^a-z0-9]","",plain_text)
    plain_text = plain_text.translate(str.maketrans(enc))
    result = ""
    
    for i in range(len(plain_text)):
        if i % 5 == 0 and i > 0:
            result += f" {plain_text[i]}"
        else:
            result += plain_text[i]
    return result

def decode(ciphered_text):
    ciphered_text = re.sub(r"[^a-z0-9]","",ciphered_text)
    return ciphered_text.translate(str.maketrans(enc))
