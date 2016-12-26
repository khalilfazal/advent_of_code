require 'monkey_patches/array'

class Traveller
  private_class_method :new

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

            if visited.include? pos
              true
            else
              visited << pos
              false
            end
          else
            false
          end
        end
      end

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

  def distance
    @pos.taxicab_metric
  end
end