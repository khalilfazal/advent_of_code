require 'monkey_patches/integer'

# A 2d point with taxicab metric
class Point
  private_class_method :new

  delegate :to_s, to: :dims

  class << self
    # @return Point
    def origin
      new 0, 0
    end
  end

  # Example: origin = Point.new 0, 0
  #
  # @param dims [Integer]
  def initialize(*dims)
    @x, @y = dims
  end

  # @return [Integer]
  def dims
    [@x, @y]
  end

  # @param dir Compass
  #
  # @return Integer
  # @return ParseError
  def move(dir)
    case dir
      when Compass::NORTH
        @y += 1
      when Compass::EAST
        @x += 1
      when Compass::SOUTH
        @y -= 1
      when Compass::WEST
        @x -= 1
      else
        raise ParseError, "Invalid direction: #{dir}"
    end
  end

  # https://en.wikipedia.org/wiki/Taxicab_geometry#Formal_definition
  #
  # @return Integer
  def taxicab_metric
    dims.sum(&:abs)
  end

  private

  # @param other Point
  #
  # @return TrueClass
  def eql?(other)
    dims.eql? other.dims
  end

  # Copied from: http://stackoverflow.com/a/919661/710755
  # No difference in runtime between Array#hash and Point#pi
  #
  # @return Integer
  def hash
    # dims.hash
    pi(*dims.map(&:to_nat))
  end

  # @param k1 Integer
  # @param k2 Integer
  #
  # @return Integer
  def pi(k1, k2)
    (k1 + k2).triangle_num + k2
  end
end