def prime_factors(number):
    factors = []
    current_factor = 2
    current_number = number
    while current_number > 1:
        while _is_divisible(current_number, current_factor):
            factors.append(current_factor)
            current_number /= current_factor
        current_factor += 1 
    return factors

def _is_divisible(number, divisor):
    return number % divisor == 0