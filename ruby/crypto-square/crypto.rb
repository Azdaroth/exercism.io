class Crypto
  
  attr_reader :text
  private :text

  def initialize(text)
    @text = text
  end

  def normalize_plaintext
    text.downcase.scan(/\w/).join
  end

  def size
    Math.sqrt(normalize_plaintext.size).ceil
  end

  def plaintext_segments
    split_segments.map { |subletters| subletters.join }
  end

  def ciphertext
    (0...size).inject("") do |cipher, idx|
      split_segments.each do |split_segment|
        cipher += split_segment[idx].to_s
      end 
      cipher
    end
  end

  def normalize_ciphertext
    ciphertext
      .chars
      .each_slice(columns)
      .map { |subletters| subletters.join }
      .join(" ")
  end

  private

    def split_segments
      @split_segments ||= normalize_plaintext.chars.each_slice(size)
    end

    def columns
      5
    end

end