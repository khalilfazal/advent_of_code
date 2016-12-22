class Triangle
  private_class_method :new

  def self.num_of_triangles_as_rows(input)
    num_of_triangles input
  end

  def self.num_of_triangles_as_columns(input)
    num_of_triangles input, transpose: true
  end

  def initialize(points)
    @a, @b, @c = points.sort
  end

  def triangle?
    @a + @b > @c
  end

  private

  def self.num_of_triangles(input, transpose: false)
    sides = input.lines.map &:split
    sides = sides.transpose.flatten.each_slice 3 if transpose
    sides.count do |triplet|
      new(triplet.map &:to_i).triangle?
    end
  end
end