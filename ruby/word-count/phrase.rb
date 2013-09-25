class Phrase
  
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    WordsCounter.new(standarized_words).count
  end

  private

    attr_reader :phrase

    def standarized_words
      phrase.downcase.scan(words_pattern)
    end

    def words_pattern
      /\w+/   
    end

end

class WordsCounter
  
  attr_reader :words
  def initialize(words)
    @words = words
  end

  def count
    words.each_with_object(Hash.new(0)) do |word, accum|
      accum[word] += 1
    end 
  end

end