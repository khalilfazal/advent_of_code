class Triangle
  def self.validate_by_rows(input: Day_3.get_input)
    validate input
  end

  def self.validate_by_columns(input: Day_3.get_input)
    validate input, transpose: true
  end

  def initialize(points)
    @a, @b, @c = points.sort
  end

  def validate
    @a + @b > @c
  end

  private

  def self.validate(input, transpose: false)
    sides = input.lines.map &:split
    sides = sides.transpose.flatten.each_slice 3 if transpose
    sides.count do |triplet|
      new(triplet.map &:to_i).validate
    end
  end
end