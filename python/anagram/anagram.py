class Anagram(object):
  
    def __init__(self, word):
        self.word = word

    def match(self, anagram_candidates):
        return filter(lambda candidate: FormattedWord(candidate).is_anagram_of(self.word), 
            anagram_candidates)


class FormattedWord(object):
  
    def __init__(self, word):
        self.word = self.standarize(word)

    def is_anagram_of(self, other_word):
        other_word = self.standarize(other_word)
        return self.word != other_word and self.sort(self.word) == self.sort(other_word)

    def standarize(self, string):
        return string.lower()

    def sort(self, string):
        return "".join(sorted(string))