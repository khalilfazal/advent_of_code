class Point
  attr_reader :x, :y, :travelled

  def self.origin
    Point.new 0, 0
  end

  def initialize(x, y)
    @x         = x
    @y         = y
    @travelled = [self.clone]
  end

  def ==(other)
    [:@x, :@y].all? do |dim|
      instance_variable_get(dim) == other.instance_variable_get(dim)
    end
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
end