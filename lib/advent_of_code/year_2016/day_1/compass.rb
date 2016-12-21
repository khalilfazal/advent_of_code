class Compass
  private_class_method :new
  attr_reader :left, :right

  def set_neighbours(left, right)
    @left  = left
    @right = right
  end

  NORTH = new
  EAST  = new
  SOUTH = new
  WEST  = new

  NORTH.set_neighbours WEST, EAST
  EAST.set_neighbours NORTH, SOUTH
  SOUTH.set_neighbours EAST, WEST
  WEST.set_neighbours SOUTH, NORTH

  private :set_neighbours

  def cycle_from
    output  = [self]
    current = self.right

    until current === self do
      output << current
      current = current.right
    end

    output
  end

  class InvalidDirection < StandardError
  end
end