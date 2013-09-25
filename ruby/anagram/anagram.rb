class Anagram
  
  def initialize(word)
    @word = FormattedWord.new(word)
  end

  def match(possible_anagrams)
    possible_anagrams.select { |possible_anagram|  FormattedWord.new(possible_anagram).anagram_of?(@word) }
  end

end

class FormattedWord

  attr_reader :candidate
  def initialize(candidate)
    @candidate = candidate.downcase
  end

  def sort
    candidate.chars.sort.join
  end

  
  def anagram_of?(other_word)
    candidate != other_word.candidate && self.sort == other_word.sort
  end

end



