require 'monkey_patches/integer'

# A 2d point with taxicab metric
class Point
  private_class_method :new

  delegate :hash, :to_s, to: :coords

  class << self
    # Gets the origin of the two dimensional space
    #
    # @return Points
    def origin
      new 0, 0
    end
  end

  # Example: origin = Point.new 0, 0
  #
  # @param coords [Integer]
  def initialize(*coords)
    @x, @y = coords
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
end