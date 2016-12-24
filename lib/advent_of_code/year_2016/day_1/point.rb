require 'monkey_patches/fixnum'

class Point
  private_class_method :new

  def self.origin
    new 0, 0
  end

  def initialize(*dims)
    @x, @y = dims
    @first_dup = nil
    @visited = Set.new [dup]
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
        raise Compass::InvalidDirection.new "Invalid direction '#{dir}'"
    end

    copy = dup

    if @visited.include?(copy) && @first_dup.nil?
      @first_dup = copy
    else
      @visited << copy
    end
  end

  def twice_visited!
    @x, @y = @first_dup.dims
    self
  end

  # https://en.wikipedia.org/wiki/Taxicab_geometry#Formal_definition
  def taxicab_metric
    dims.map(&:abs).inject :+
  end

  private

  def eql?(other)
    dims.eql? other.dims
  end

  # Copied from: http://stackoverflow.com/a/919661/710755
  # No difference in run time between dims.hash and cantor_pairing
  def hash
    #dims.hash
    π *dims.map(&:to_nat)
  end

  def π(k1, k2)
    (k1 + k2).triangle_num + k2
  end
end