require 'forwardable'
require 'helpers/boolean'
require 'monkey_patches/array'

# a traveller as a location and a direction
class Traveller
  extend Forwardable

  private_class_method :new
  def_delegator :pos, :taxicab_metric, :distance

  class << self
    # @param input String
    #
    # @return Integer
    def endpoints_distance(input)
      travel_unparsed input
    end

    # @param input String
    #
    # @return Integer
    def twice_visited_points_distance(input)
      travel_unparsed input, to_end: false
    end

    private

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

      # noinspection RubyResolve
      traveller.distance
    end
  end

  def initialize
    @dir = Compass::NORTH
    @pos = Point.origin
  end

  # @param command Symbol
  #
  # @return Integer|Compass|ParseError
  def move(command)
    if command === :straight
      @pos.move @dir
    else
      @dir = @dir.send command
    end
  end

  # @return Point
  def pos
    @pos.dup
  end
end