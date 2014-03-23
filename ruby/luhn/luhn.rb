class Luhn

  def self.create(number)
    if new(number).valid?
      number
    else
      modify_number_until_valid(number)
    end    
  end

  attr_reader :number, :split_numbers
  private :number, :split_numbers
  
  def initialize(number)
    @number = number
    @split_numbers = number.to_s.chars.map(&:to_i)
  end

  def addends
    split_numbers.reverse.map.with_index do |num, idx|
      if idx.odd?
        num *= 2 
        num -= 9 if num >= 10
      end
      num
    end.reverse
  end

  def checksum
    addends.reduce(0, :+)
  end

  def valid?
    checksum % 10 == 0
  end

  private

    def self.modify_number_until_valid(number)
      number *= 10
      until new(number).valid?
        number += 1
      end
      number
    end

end