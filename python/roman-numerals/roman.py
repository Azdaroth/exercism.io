_ARABIC_ROMAN_MAPPING = {
    1000: "M",
    900: "CM",
    500: "D",
    400: "CD",
    100: "C",
    90: "XC",
    50: "L",
    40: "XL",
    10: "X",
    9: "IX",
    5: "V",
    4: "IV",
    1: "I"    
}


def RomanNumeral(arabic_numeral):
    roman_numeral = ""
    sorted_mapping = reversed(sorted(_ARABIC_ROMAN_MAPPING.iteritems()))
    for current_arabic, current_roman in sorted_mapping:
        while arabic_numeral >= current_arabic:
            roman_numeral += current_roman
            arabic_numeral -= current_arabic
    return roman_numeral

