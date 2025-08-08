def classify(number):
    """ A perfect number equals the sum of its positive divisors.

    :param number: int a positive integer
    :return: str the classification of the input integer
    """
    if number < 1:
        raise ValueError("Classification is only possible for positive integers.")
    
    divisors = [x for x in range(1,number) if number % x == 0]

    if number == sum(divisors):
        return 'perfect'
    if number > sum(divisors):
        return 'deficient'
    else:
        return 'abundant'

    
