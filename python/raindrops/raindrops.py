_FACTOR_WORD_MAPPING = {
    3: "Pling",
    5: "Plang",
    7: "Plong"
}

_FACTORS  = [3, 5, 7]

def raindrops(number):
    result = "".join(_mapped_factors(number))
    if result == "":
        result = str(number)
    return result

def _mapped_factors(number):
    return [
        _FACTOR_WORD_MAPPING[factor] 
        for factor in _FACTORS
        if _is_divisible_by(number, factor)
    ]

def _is_divisible_by(number, divisor):
    return number % divisor == 0