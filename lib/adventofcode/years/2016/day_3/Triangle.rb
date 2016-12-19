class Triangle
  def self.validate(input: Day_3.get_input)
    input.lines.select do |line|
      Triangle.new(line.split.map(&:to_i)).validate
    end.length
  end

  def initialize(points)
    @a, @b, @c = points.sort
  end

  def validate
    @a + @b > @c
  end
end