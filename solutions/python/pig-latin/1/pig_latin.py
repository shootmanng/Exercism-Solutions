def translate(text):
    vowels = ["a","e","i","o","u"]
    first_vowel = min([text.index(x) for x in text if x in vowels], default = 0)
    phrase = ""
    
    if " " in text:
        for word in text.split():
            phrase += translate(word) + " "
    
    if (text[0] in vowels) or (text[:2] == "xr" or text[:2] == "yt"):
        text += "ay"
        
    elif ("qu" in text) and not any(c in vowels for c in text[:text.index("qu")]):
        text = text[(text.index("qu") + 2):len(text)] + text[:text.index("qu") + 2] +"ay"
        
    elif ("y" in text) and (text.index("y") > 0) and not any(c in vowels for c in text[:text.index("y")]):
        text = text[text.index("y"):len(text)] + text[:text.index("y")] + "ay"
        
    else:
        text = text[first_vowel:len(text)] + text[:first_vowel] + "ay"

    # needed or last part of multi-word phrase will get double ending
    if phrase != "":
        text = phrase.rstrip()
        
    return text