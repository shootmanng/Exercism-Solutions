import re

def counter(tile):
    if tile == "*":
        return 1
    return 0
        
def annotate(garden):
    if len(garden) == 0:
        return []
    
    result = [""] * len(garden)
    check = max([len(garden[x]) for x in range(len(garden))])
    
    for i in range(len(garden)):
        check2 = re.sub(r"[ *]","",garden[i])
        # errors
        if len(garden[i]) != check or check2 != "":
            raise ValueError("The board is invalid with current input.")
        
        for j in range(check):
            
            temp = 0
            
            if j == 0 and check - 1 != 0 and len(garden) != 1:
                if i == 0:
                    temp = counter(garden[i][j]) + counter(garden[i][j+1]) + counter(garden[i+1][j+1]) + counter(garden[i+1][j])
                elif i == len(garden) - 1:
                    temp = counter(garden[i][j]) + counter(garden[i-1][j]) + counter(garden[i-1][j+1]) + counter(garden[i][j+1])
                else:
                    temp = counter(garden[i][j]) + counter(garden[i-1][j]) + counter(garden[i-1][j+1]) + counter(garden[i][j+1]) + counter(garden[i+1][j+1]) + counter(garden[i+1][j])

            elif j == check - 1 and check - 1 != 0 and len(garden) != 1:
                if i == 0:
                    temp = counter(garden[i][j]) + counter(garden[i][j-1]) + counter(garden[i+1][j-1]) + counter(garden[i+1][j])
                elif i == len(garden) - 1:
                    temp = counter(garden[i][j]) + counter(garden[i-1][j]) + counter(garden[i-1][j-1]) + counter(garden[i][j-1])
                else:
                    temp = counter(garden[i][j]) + counter(garden[i-1][j]) + counter(garden[i-1][j-1]) + counter(garden[i][j-1]) + counter(garden[i+1][j-1]) + counter(garden[i+1][j])

            elif check - 1 == 0:
                if i == 0:
                    temp = counter(garden[i][j]) + counter(garden[i+1][j])
                elif i == len(garden) - 1:
                    temp = counter(garden[i][j]) + counter(garden[i-1][j])
                else:
                    temp = counter(garden[i][j]) + counter(garden[i-1][j]) + counter(garden[i+1][j])

            elif len(garden) == 1:
                if j == 0:
                    temp = counter(garden[i][j]) + counter(garden[i][j+1])
                elif j == check - 1:
                    temp = counter(garden[i][j]) + counter(garden[i][j-1])
                else:
                    temp = counter(garden[i][j]) + counter(garden[i][j-1]) + counter(garden[i][j+1]) 
            else:
                if i == 0:
                    temp = counter(garden[i][j]) + counter(garden[i][j-1]) + counter(garden[i][j+1]) + counter(garden[i+1][j+1]) + counter(garden[i+1][j]) + counter(garden[i+1][j-1])
                elif i == len(garden) - 1:
                    temp = counter(garden[i][j]) + counter(garden[i][j-1]) + counter(garden[i-1][j-1]) + counter(garden[i-1][j]) + counter(garden[i-1][j+1]) + counter(garden[i][j+1])
                else:
                    temp = counter(garden[i][j]) + counter(garden[i][j+1]) + counter(garden[i][j-1]) + counter(garden[i-1][j]) + counter(garden[i-1][j+1]) + counter(garden[i-1][j-1]) + counter(garden[i+1][j+1]) + counter(garden[i+1][j]) + counter(garden[i+1][j-1])
                    
            if temp != 0 and garden[i][j] != "*":
                result[i] += str(temp)
            elif garden[i][j] == "*":
                result[i] += "*"
            else:
                result[i] += " "
    return result
