class Binary
  
  def initialize(binary)
    @digits = convert(binary)
  end

  def to_decimal
    @digits.reverse.each_with_index.inject(0) do |sum, (digit, idx)|
      sum += digit * 2**idx
    end
  end

  private

    def convert(binary)
      return [0] if binary.to_i.to_s != binary 
      binary.scan(/[0,1]/).map(&:to_i)
    end

end