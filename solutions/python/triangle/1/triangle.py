def is_triange(sides):
    
    if ((sides[0] + sides[1] < sides[2]) 
        or (sides[1] + sides[2] < sides[0])
        or (sides[0] + sides[2] < sides[1])
        or (min(sides) <= 0)
       ):
        return False
    return True
    
def equilateral(sides):
    if is_triange(sides):
        return (sides[0] == sides[1]) and (sides[1] == sides[2])
    else:
        return False

def isosceles(sides):
    if is_triange(sides):
        return (sides[0] == sides[1]) or (sides[1] == sides[2]) or (sides[2] == sides[0])
    else:
        return False


def scalene(sides):
    if is_triange(sides):
        return not isosceles(sides)
    else:
        return False
