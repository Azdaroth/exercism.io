class PrimeFactors

  def self.for(number)    
    new(number).calculate
  end

  def initialize(number)
    @number = number
  end

  def calculate
    factors = []
    factor = 2
    while @number != 1
      if divisible?(factor)
        factors << factor
        @number /= factor
      else
        factor += 1
      end
    end
    factors
  end

  private

    def divisible?(factor)
      @number % factor == 0
    end

end