letters = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
    ]

def rows(letter):
    
    i = letters.index(letter) + 1
    top = [" " * (i - 1) + "A" + " " * (i - 1)]
    top.extend([(" " * (i - x - 1) + letters[x] + " " * (x - 1)) + " " + (" " * (i - x - 1) + letters[x] + " " * (x - 1))[::-1] for x in range(1, i)])
    bottom = top[:len(top)-1]
    bottom.reverse()
    top.extend(bottom)
    return top