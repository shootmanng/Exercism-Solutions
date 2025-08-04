def is_armstrong_number(number):
    exp = len(str(number))
    arr = [int(x) ** exp for x in str(number)]
    return sum(arr) == number