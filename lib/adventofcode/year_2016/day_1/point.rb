class Point
  attr_reader :x, :y

  def self.origin
    new 0, 0
  end

  def initialize(x, y)
    @x         = x
    @y         = y
    @first_dup = nil
    @visited   = Set.new [self.clone]
  end

  def eql?(other)
    [:@x, :@y].all? do |dim|
      instance_variable_get(dim).eql?(other.instance_variable_get dim)
    end
  end

  def hash
    [@x, @y].hash
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

    clone = self.clone

    if @visited.include?(clone) && @first_dup.nil?
      @first_dup = clone
    else
      @visited << clone
    end
  end

  def twice_visited!
    other = @first_dup

    [:@x, :@y].each do |var|
      instance_variable_set var, other.instance_variable_get(var)
    end

    self
  end

  def taxicab_metric
    @x.abs + @y.abs
  end
end