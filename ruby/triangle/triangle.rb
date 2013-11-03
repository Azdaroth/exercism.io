class Triangle
  
  TRIANGLE_KINDS = %i[equilateral isosceles scalene]

  def initialize(a, b, c)
    TriangleValidator.new(a, b, c).validate!
    @a = a
    @b = b
    @c = c
  end

  def kind
    TRIANGLE_KINDS.detect { |triangle_kind| send("#{triangle_kind}?") }
  end

  def equilateral?
    sides.uniq.count == 1
  end

  def isosceles?
    sides.uniq.count == 2
  end

  def scalene?
    sides.uniq.count == 3
  end

  private

    def sides
      [@a, @b, @c]
    end

end

class TriangleValidator

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def validate!
    unless triangle_inequality_satisfied?
      raise TriangleError, "Invalid sides' values - cannot create a triangle"
    end
  end

  def triangle_inequality_satisfied?
    (@b - @c).abs < @a and @a < (@b + @c)
  end

end

class TriangleError < Exception
end