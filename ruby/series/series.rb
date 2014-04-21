class Series
  
  attr_reader :number
  private :number

  def initialize(number)
    @number = number
  end

  def slices(amount)
    validate_amount!(amount)
    separate_numbers.each_cons(amount).reduce([]) { |accum, basket| accum << basket }
  end

  private

    def separate_numbers
      @separate_numbers ||= number.chars.map(&:to_i)
    end

    def validate_amount!(amount)
      if amount > separate_numbers.size
        raise ArgumentError, "amount of consecutive numbers cannot be
          larger than numbers in input"
      end
    end

end