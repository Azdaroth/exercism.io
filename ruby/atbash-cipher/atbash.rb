class Atbash

  def self.encode(text)
    new(text).encode
  end

  def initialize(text)
    @text = text
  end

  def encode
    per_five(reverse_letters)
  end

  private

    def per_five(letters)
      letters.scan(/.{1,5}/).join(" ")
    end

    def reverse_letters
      tranform_text.map { |char| reverse_letter(char) }.join
    end

    def alphabet
      "abcdefghijklmnopqrstuvwxyz"
    end

    def reverse_letter(char)
      if letter?(char)
        index = alphabet.index(char)
        alphabet.reverse[index]
      else
        char
      end
    end

    def letter?(char)
      char != char.to_i.to_s
    end

    def tranform_text
      @text.downcase.scan(/\w/)
    end

end