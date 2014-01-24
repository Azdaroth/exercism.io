import re

def Binary(input):
    return BinaryToDecimal(input).convert()


class BinaryToDecimal(object):
    
    _VALID_INPUT_PATTERN = "^[01]+$"

    def __init__(self, input):
        valid_input = self._transform_input(input)
        self.reversed_enumerable_input = enumerate(reversed(list(valid_input)))

    def convert(self):
        return sum(
            self._calculate(number, index)
            for index, number in self.reversed_enumerable_input
        )

    def _calculate(self, binary, index):
        return int(binary) * (2**index)

    def _transform_input(self, input):
        transformed = re.search(self._VALID_INPUT_PATTERN, input)
        if transformed:
            return transformed.group()
        else:
            return ""