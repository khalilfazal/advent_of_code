class Compass
  class InvalidDirection < StandardError
  end

  attr_reader :clockwise, :widdershins

  private_class_method :new

  def initialize(name)
    @name = name
  end

  def neighbours=(neighbours)
    @widdershins, @clockwise = neighbours
  end

  NORTH = new 'N'
  EAST = new 'E'
  SOUTH = new 'S'
  WEST = new 'W'

  NORTH.neighbours = WEST, EAST
  EAST.neighbours = NORTH, SOUTH
  SOUTH.neighbours = EAST, WEST
  WEST.neighbours = SOUTH, NORTH

  private :neighbours=

  def cycle
    output = [self]
    current = @clockwise

    until current === self do
      output << current
      current = current.clockwise
    end

    output
  end

  def to_s
    @name
  end
end