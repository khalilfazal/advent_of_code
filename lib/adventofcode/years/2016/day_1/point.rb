class Point
  attr_reader :x, :y, :travelled

  def self.origin
    Point.new 0, 0
  end

  def ==(other)
    @x == other.x && @y == other.y
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
    end

    @travelled << self.clone
  end

  def taxicab_metric
    @x.abs + @y.abs
  end

  private

  def initialize(x, y)
    @x         = x
    @y         = y
    @travelled = [self.clone]
  end
end