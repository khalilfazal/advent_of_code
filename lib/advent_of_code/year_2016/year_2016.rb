require 'advent_of_code'

module Year2016
  module_function

  # @param day Integer
  #
  # @return String
  def input(day:)
    AdventOfCode.input year: 2016, day: day
  end

  def make_day(day)
    const_set "Day#{day}", Module.new {
      module_function

      @day = day

      # @return String
      def input
        Year2016.input day: @day
      end
    }
  end

  (1 .. 25).map { |day| make_day day }
end