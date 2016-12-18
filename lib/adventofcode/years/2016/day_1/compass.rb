class Adventofcode::Year_2016::Day_1::Compass
  attr_reader :left, :right

  def set_neighbours(left, right)
    @left  = left
    @right = right
  end

  def cycle_from
    output  = [self]
    current = self.right

    until current === self do
      output << current
      current = current.right
    end

    output
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
end