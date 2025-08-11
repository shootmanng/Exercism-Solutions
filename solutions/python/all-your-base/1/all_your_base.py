def b10(input_base, digits):
    if input_base == b10:
        return int("".join(digits))
    return sum([digits[i] * input_base ** (len(digits) - i - 1) for i in range(len(digits))])

def out_b(output_base, num):
    result = []
    
    while num >= output_base:
        result.append(num % output_base)
        num //= output_base
    result.append(num)
    result.reverse()
    return result
    
def rebase(input_base, digits, output_base):
    
    if input_base < 2:
        raise ValueError("input base must be >= 2")
    if [1 for d in digits if ((input_base <= d) or (d < 0))]:
        raise ValueError("all digits must satisfy 0 <= d < input base")
    if output_base < 2:
        raise ValueError("output base must be >= 2")
    
    num = b10(input_base, digits)
        
    return out_b(output_base, num)