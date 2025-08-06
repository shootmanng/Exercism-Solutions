import re

def is_pangram(sentence):
    pan = None
    
    letters = set([x for x in "abcdefghijklmnopqrstuvwxyz"])
    s_letters = set(re.sub(r"[^A-Za-z]","",sentence.lower()))
    
    return letters == s_letters