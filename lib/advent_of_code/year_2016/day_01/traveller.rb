autoload :Boolean, 'helpers/boolean'
autoload :Forwardable, 'forwardable'
require 'monkey_patches/array'

# A traveller has a location and a direction
class Traveller
  extend Forwardable

  private_class_method :new

  def_delegator :@pos, :taxicab_metric, :distance
  def_delegator :@pos, :dup, :pos

  class << self
    # Finds the last point to be visited
    # and returns its distance from the origin using the taxicab metric
    #
    # @param input String
    #
    # @return Integer
    def endpoints_distance(input)
      travel_unparsed input
    end

    # Finds the first point to be visited twice
    # and returns its distance from the origin using the taxicab metric
    #
    # @param input String
    #
    # @return Integer
    def twice_visited_points_distance(input)
      travel_unparsed input, to_end: false
    end

    private

    # Finds a point (either the end point or the first to be visited twice)
    # and returns its distance from the origin using the taxicab metric
    #
    # @param input String
    # @param to_end Boolean
    #
    # @return Integer
    def travel_unparsed(input, to_end: true)
      commands = input.parse_commands
      traveller = new

      if to_end
        commands.each do |command|
          traveller.move command
        end
      else
        visited = Set[traveller.pos]

        commands.detect do |command|
          traveller.move command

          if command === :straight
            pos = traveller.pos
            visited.include?(pos) || !(visited << pos)
          end
        end
      end

      traveller.distance
    end
  end

  # Initialize a +traveller+ starting from the origin and facing north
  def initialize
    @dir = Compass::NORTH
    @pos = Point.origin
  end

  # move straight or change direction
  #
  # @param command Symbol
  #
  # @return Integer | Compass
  # @throws ParseError
  def move(command)
    if command === :straight
      @pos.move @dir
    else
      @dir = @dir.send command
    end
  end
end