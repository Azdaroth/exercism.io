class Word(object):

    _LETTERS_POINTS_MAPPING = {
        "A": 1,
        "B": 3,
        "C": 3,
        "D": 2,
        "E": 1,
        "F": 4,
        "G": 2,
        "H": 4,
        "I": 1,
        "J": 8,
        "K": 5,
        "L": 1,
        "M": 3,
        "N": 1,
        "O": 1,
        "P": 3,
        "Q": 10,
        "R": 1,
        "S": 1,
        "T": 1,
        "U": 1,
        "V": 4,
        "W": 4,
        "X": 8,
        "Y": 4,
        "Z": 10
    }
  
    def __init__(self, word):
        self.word = word
        self._points = [self._point_for(letter) for letter in list(word)]
    
    def score(self):
        return sum(self._points)
    
    def _point_for(self, letter):
        return self._LETTERS_POINTS_MAPPING.get(letter.upper(), 0)

