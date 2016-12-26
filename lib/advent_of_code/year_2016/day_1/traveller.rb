require 'forwardable'
require 'monkey_patches/array'

class Traveller
  extend Forwardable

  private_class_method :new
  def_delegator :pos, :taxicab_metric, :distance

  class << self
    def endpoints_distance(input)
      travel_unparsed input
    end

    def twice_visited_points_distance(input)
      travel_unparsed input, to_end: false
    end

    private

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

  def move(command)
    if command === :straight
      @pos.move @dir
    else
      @dir = @dir.send command
    end
  end

  def pos
    @pos.dup
  end
end