class Traveller
  def self.blocks_travelled(input = Day_1.get_input)
    Traveller.travel_unparsed_path(input).taxicab_metric
  end

  def self.visited_twice_distance(input = Day_1.get_input)
    travelled = Traveller.travel_unparsed_path(input).travelled

    travelled.detect do |block|
      travelled.rindex(block) != travelled.index(block)
    end.taxicab_metric
  end

  def self.travel_unparsed_path(input)
    Traveller.new.instance_eval do
      travel input.parse_path
    end
  end

  private

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