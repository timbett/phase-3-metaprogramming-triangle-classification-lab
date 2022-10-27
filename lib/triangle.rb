class Triangle
  # write code here
  attr_accessor :sides
  def initialize(a, b, c)
    self.sides = a, b, c
  end
  def kind
    raise TriangleError if zero_or_negative_side? || !satisfies_triangle_inequality?
    @kind ||= case unique_side_lengths
              when 3
                :scalene
              when 2
                :isosceles
              when 1
                :equilateral
              end
  end
  class TriangleError < StandardError
    "This is not a Valid triangle!"
  end
  private
  def unique_side_lengths
    sides.uniq.count
  end
  def zero_or_negative_side?
    sides.any? {|side| side <= 0 }
  end
  def satisfies_triangle_inequality?
    sides.inject(:+) > 2 * sides.max
  end
end
