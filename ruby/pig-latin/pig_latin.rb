# This is ultra complex
# but I don't get this one

class PigLatin
  
  def self.translate(word)
    word.split(" ").map do |separated_word|
      new(separated_word).translate  
    end.join(" ")
  end

  attr_reader :word
  private :word

  def initialize(word)
    @word = WordForPigLatin.new(word)
  end

  def translate
    if word.first_consonant_move_prohibited? || word.starts_with_vowel? 
      word.to_s + "ay"
    else
      word.move_first_consonant_cluster_to_the_end + "ay"
    end
  end

  private

end

class WordForPigLatin
  
  attr_reader :word
  private :word

  def initialize(word)
    @word = word
  end

  def to_s
    word
  end

  def starts_with_vowel?
    Char.new(word.chars.first).vowel?
  end

  def first_consonant_move_prohibited?
    %w[xr yt].any? { |cluster| word.start_with? cluster }  
  end

  def move_first_consonant_cluster_to_the_end    
    first_consonant_cluster = extract_first_consonant_cluster   
    erase_consonant_cluster_at_the_begginging(first_consonant_cluster) + first_consonant_cluster
  end

  private

    def extract_first_consonant_cluster
      if starts_with_special_case?
        special_cases.find { |cluster| word.start_with? cluster }
      else
        word.chars.take_while do |char|
          !Char.new(char).vowel?
        end.join
      end
    end

    def erase_consonant_cluster_at_the_begginging(cluster)
      current_word = word.chars
      cluster.size.times do
        current_word.shift
      end
      current_word.join
    end

    def starts_with_special_case?
      special_cases.any? { |cluster| word.start_with? cluster }
    end

    def special_cases
      %w[ch qu squ thr th sch yt]
    end

end

class Char
  
  attr_reader :char
  private :char

  def initialize(char)
    @char = char
  end

  def vowel?
    vowels.any? { |vowel| vowel == char }
  end

  private

    def vowels
      %w[a o e u i]
    end

end