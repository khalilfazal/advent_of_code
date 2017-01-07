require 'monkey_patches/integer'

# A 2d point with taxicab metric
class Point
  private_class_method :new

  delegate :to_s, to: :coords

  class << self
    # Gets the origin of the two dimensional space
    #
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

  # Gets where in the space the +Point+ currently is
  #
  # @return [Integer]
  def coords
    [@x, @y]
  end

  # Move the +Point+ in a particular direction
  #
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

  # Calculate the distance the +Point+ is from the origin using the taxicab metric
  #
  # https://en.wikipedia.org/wiki/Taxicab_geometry#Formal_definition
  #
  # @return Integer
  def taxicab_metric
    coords.sum(&:abs)
  end

  private

  # Checks to see if two points are equal by checking there coordinates
  #
  # @param other Point
  #
  # @return TrueClass
  def eql?(other)
    coords.eql? other.coords
  end

  # Copied from: http://stackoverflow.com/a/919661/710755
  # No difference in runtime between Array#hash and Point#pi
  #
  # @return Integer
  def hash
    # coords.hash
    pi(*coords.map(&:to_nonneg))
  end

  # The Cantor Pairing function for two non-negative numbers
  # https://en.wikipedia.org/wiki/Pairing_function#Cantor_pairing_function
  #
  # @param k1 Integer assumed to be non-negative
  # @param k2 Integer assumed to be non-negative
  #
  # @return Integer
  def pi(k1, k2)
    (k1 + k2).triangle_num + k2
  end
end