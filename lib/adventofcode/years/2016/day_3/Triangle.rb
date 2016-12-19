class Triangle
  def self.validate(input: Day_3.get_input)
    input.lines.select do |line|
      Triangle.new(*line.split.map(&:to_i)).validate
    end.length
  end

  def validate
    [
        @a + @b > @c,
        @a + @c > @b,
        @b + @c > @a
    ].all?
  end

  private

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end
end