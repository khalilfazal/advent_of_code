require 'monkey_patches/integer'

class Point
  private_class_method :new

  class << self
    def origin
      new 0, 0
    end
  end

  def initialize(*dims)
    @x, @y = dims
  end

  def dims
    [@x, @y]
  end

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
        raise Compass::InvalidDirection, "Invalid direction '#{dir}'"
    end
  end

  # https://en.wikipedia.org/wiki/Taxicab_geometry#Formal_definition
  def taxicab_metric
    dims.sum(&:abs)
  end

  def to_s
    dims.to_s
  end

  private

  def eql?(other)
    dims.eql? other.dims
  end

  # Copied from: http://stackoverflow.com/a/919661/710755
  # No difference in run time between Array#hash and Point#cantor_pairing
  def hash
    #dims.hash
    π *dims.map(&:to_nat)
  end

  def π(k1, k2)
    (k1 + k2).triangle_num + k2
  end
end