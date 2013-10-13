class Grains
  
  SQUARES = 64
  FIRST_TERM = 1
  COMMON_RATIO = 2

  def square(number)
    calculator.term(FIRST_TERM, COMMON_RATIO, number)
  end

  def total
    (1..SQUARES).map { |number| square(number) }.reduce(:+)
  end

  private

    def calculator
      @calculator ||= GeometricSeries
    end

end

module GeometricSeries
  
  def self.term(first_term, common_ratio, which_term)
    (common_ratio**(which_term - 1))*first_term
  end

end