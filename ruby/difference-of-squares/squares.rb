class Squares
  
  attr_reader :limit
  private :limit

  def initialize(limit)
    @limit = limit
  end

  def square_of_sums
    (range.reduce(0, :+))**2
  end

  def sum_of_squares
    range.map { |num| num**2 }.reduce(0, :+)
  end

  def difference
    square_of_sums - sum_of_squares
  end


  private

  def range
    @range ||= (start_point..limit)
  end

    def start_point
      1
    end

end