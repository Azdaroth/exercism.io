class Year
  
  def initialize(value)
    @value = value
  end

  def leap?
    divisble_by?(4) and (!divisble_by?(100) or divisble_by?(400))
  end

  private

    attr_reader :value

    def divisble_by?(divisor)
      (value % divisor) == 0
    end

end