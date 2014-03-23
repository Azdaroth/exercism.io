class Trinary
  
  attr_reader :numbers, :indexes
  private :numbers, :indexes

  def initialize(number)
    @numbers = number.split("")
    @indexes = @numbers.count - 1
  end

  def to_decimal
    numbers
      .map.with_index { |number, current_index|  convert_to_decimal_part(number, current_index) }
      .reduce(:+)  
  end

  private

    def convert_to_decimal_part(number, current_index)
      number.to_i * (3**(indexes - current_index)) 
    end

end