require 'monkey_patches/array'

class Traveller
  private_class_method :new

  class << self
    def endpoints_distance(input)
      travel_unparsed input
    end

    def twice_visited_points_distance(input)
      travel_unparsed input, end_point: false
    end

    private

    def travel_unparsed(input, end_point: true)
      point = new.travel input.parse_path
      point.twice_visited! unless end_point
      point.taxicab_metric
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