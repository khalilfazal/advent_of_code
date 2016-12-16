require_relative '2016'

class String
  def parse_path
    self.split(/, /).map do |block|
      dir, n = block.match(/(L|R)([0-9]+)/).captures

      [case dir
         when 'L'
           :left
         when 'R'
           :right
       end,
       n.to_i]
    end
  end
end

module Adventofcode::Year_2016::Day_1
  class Compass
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

    NORTH = Compass.new
    EAST  = Compass.new
    SOUTH = Compass.new
    WEST  = Compass.new

    NORTH.set_neighbours WEST, EAST
    EAST.set_neighbours NORTH, SOUTH
    SOUTH.set_neighbours EAST, WEST
    WEST.set_neighbours SOUTH, NORTH

    private :set_neighbours
  end

  class Point
    attr_reader :x, :y, :travelled

    def self.origin
      Point.new 0, 0
    end

    def ==(other)
      @x == other.x && @y == other.y
    end

    def move(dir)
      case dir
        when Compass::NORTH
          @y += 1
        when Compass::EAST
          @x += 1
        when Compass::SOUTH
          @y -= 1
        when Compass::WEST
          @x -= 1
      end

      @travelled << self.clone
    end

    def taxicab_metric
      @x.abs + @y.abs
    end

    private

    def initialize(x, y)
      @x         = x
      @y         = y
      @travelled = [self.clone]
    end
  end

  class Traveller
    def self.blocks_travelled(input, from_url = false)
      Traveller.travel_unparsed_path(input, from_url).taxicab_metric
    end

    def self.visited_twice_distance(input, from_url = false)
      travelled = Traveller.travel_unparsed_path(input, from_url).travelled

      travelled.detect do |block|
        travelled.rindex(block) != travelled.index(block)
      end.taxicab_metric
    end

    private

    def self.travel_unparsed_path(input, from_url)
      input = Adventofcode.open_uri input if from_url

      Traveller.new.instance_eval do
        travel input.parse_path
      end
    end

    def initialize
      @dir = Compass::NORTH
      @pos = Point.origin
    end

    def travel(path)
      path.each do |dir, n|
        @dir = @dir.send dir

        n.times do
          @pos.move @dir
        end
      end

      @pos
    end
  end
end