class Compass
  class InvalidDirection < StandardError
  end

  attr_reader :left, :right

  private_class_method :new

  def neighbours=(neighbours)
    @left, @right = neighbours
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
    current = self.right

    until current === self do
      output << current
      current = current.right
    end

    output
  end
end