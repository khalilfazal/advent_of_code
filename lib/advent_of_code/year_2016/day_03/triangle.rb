autoload :Boolean, 'helpers/boolean'

# represents triangles that can be validated with the triangle inequality
class Triangle
  private_class_method :new

  class << self
    # @param input String
    #
    # @return Integer
    def num_of_triangles_as_rows(input)
      num_of_triangles input
    end

    # @param input String
    #
    # @return Integer
    def num_of_triangles_as_columns(input)
      num_of_triangles input, transpose: true
    end

    private

    # @param input String
    # @param transpose Boolean
    #
    # @return Integer
    def num_of_triangles(input, transpose: false)
      sides = input.lines.map(&:split)
      sides = sides.transpose.flatten.each_slice 3 if transpose
      sides.count do |triplet|
        new(triplet.map(&:to_i)).triangle?
      end
    end
  end

  # @param points [Integer]
  def initialize(points)
    @a, @b, @c = points.sort
  end

  # @return Boolean
  def triangle?
    @a + @b > @c
  end
end