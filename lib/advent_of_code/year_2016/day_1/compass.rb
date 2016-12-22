class Compass
  class InvalidDirection < StandardError
  end

  attr_reader :clockwise, :widdershins

  private_class_method :new

  def neighbours=(neighbours)
    @clockwise, @widdershins = neighbours
  end

  NORTH = new
  EAST = new
  SOUTH = new
  WEST = new

  NORTH.neighbours = WEST, EAST
  EAST.neighbours = NORTH, SOUTH
  SOUTH.neighbours = EAST, WEST
  WEST.neighbours = SOUTH, NORTH

  private :neighbours=

  def cycle
    output = [self]
    current = self.widdershins

    until current === self do
      output << current
      current = current.widdershins
    end

    output
  end
end