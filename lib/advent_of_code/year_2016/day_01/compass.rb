# A compass implemented with only 4 instances: one per direction
class Compass
  attr_reader :clockwise, :widdershins

  private_class_method :new

  # @param name Symbol
  def initialize(name)
    @name = name
  end

  # @param neighbours [Compass]
  # @return [Compass]
  def neighbours=(neighbours)
    @widdershins, @clockwise = neighbours
  end

  NORTH = new :N
  EAST = new :E
  SOUTH = new :S
  WEST = new :W

  NORTH.neighbours = WEST, EAST
  EAST.neighbours = NORTH, SOUTH
  SOUTH.neighbours = EAST, WEST
  WEST.neighbours = SOUTH, NORTH

  private :neighbours=

  # @return [Compass]
  def cycle
    output = [self]
    current = @clockwise

    until current === self
      output << current
      current = current.clockwise
    end

    output
  end

  # @return String
  def to_s
    @name.to_s
  end
end