def score(x, y):
    z = x ** 2 + y ** 2

    if z > 100:
        return 0
    if 25 < z <= 100:
        return 1
    if 1 < z <= 25:
        return 5
    if z <= 1:
        return 10
