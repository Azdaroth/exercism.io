class Cipher
  
  attr_reader :distance, :key
  private :distance

  def initialize(key=nil)
    distance = Distance.new(key)
    distance.validate
    @distance = distance
    if key.nil?
      @key = default_key
    else
      @key = key
    end
  end

  def encode(text)
    text.split("").map.with_index do |letter, idx|
      distance.move_forward(letter, idx)
    end.join("")
  end

  def decode(cipher)
    cipher.split("").map.with_index do |letter, idx|
      distance.move_backward(letter, idx)
    end.join("")
  end

  private

    def default_key
      "aaaaaaaaaa"
    end

end

class Distance

  attr_reader :key, :digits, :alphabet, :alphabet_count
  private :key, :digits, :alphabet, :alphabet_count

  def initialize(key)
    @key = key
    @digits = ("0".."9").to_a
    @alphabet = ("a".."z").to_a
    @alphabet_count = alphabet.count
  end

  def validate
    return true if key.nil?
    validate_against_empty_string
    validate_against_capital_letters
    validate_against_numeric
  end

  def value(index)
    alphabet.index(key.to_s.split("")[index]).to_i
  end

  def move_forward(letter, index)
    current_index = alphabet.index(letter)
    new_index = current_index + value(index)
    new_index = index_not_exceeding_max_value_for_alphabet(new_index)
    alphabet[new_index]
  end

  def move_backward(letter, index)
    current_index = alphabet.index(letter)
    new_index = current_index - value(index)
    new_index = index_not_exceeding_max_value_for_alphabet(new_index)
    alphabet[new_index]
  end

  private

    def validate_against_empty_string
      if key.empty?
        raise ArgumentError, "cannot be an empty string"
      end
    end

    def validate_against_capital_letters
      if key.split("").any? { |letter| letter.upcase == letter }
        raise ArgumentError, "cannot be a capital letter"
      end
    end

    def validate_validate_against_numeric
      if key.split("").any? { |letter| digits.include? letter }
        raise ArgumentError, "cannot be a digit"
      end
    end

    def index_not_exceeding_max_value_for_alphabet(index)
      if index >= alphabet_count
        index % alphabet_count
      else
        index
      end
    end
  
end