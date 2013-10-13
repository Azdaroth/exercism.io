class Anagram(object):
  
    def __init__(self, word):
        self.word = word

    def match(self, candidates):
        formatted_word = FormattedWord(self.word)
        return [candidate for candidate in candidates 
            if FormattedWord(candidate).is_anagram_of(formatted_word)]


class FormattedWord(object):
  
    def __init__(self, word):
        self._lower = word.lower();
        self._sorted = "".join(sorted(self._lower))

    def is_anagram_of(self, other_word):
        return self._lower!= other_word._lower and self._sorted == other_word._sorted

