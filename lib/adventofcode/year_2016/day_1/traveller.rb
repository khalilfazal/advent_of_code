require 'monkey_patches/array'

class Traveller
  private_class_method :new

  def self.endpoint_distance(input)
    Traveller.travel_unparsed input
  end

  def self.twice_visited_distance(input)
    Traveller.travel_unparsed input, end_point: false
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

  private

  def self.travel_unparsed(input, end_point: true)
    point = new.travel input.parse_path
    point.twice_visited! unless end_point
    point.taxicab_metric
  end
end