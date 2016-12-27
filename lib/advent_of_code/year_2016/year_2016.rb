require 'advent_of_code'
require 'monkey_patches/module'

module AdventOfCode::Year2016
  module_function

  # @param day Integer
  #
  # @return String
  def input(day:)
    parent.input year: 2016, day: day
  end

  # @param day Integer
  #
  # @return Module
  def make_day(day)
    define_module "Day#{day}" do
      # @return String
      define_singleton_method :input do
        parent.input day: day
      end
    end
  end

  (1 .. 25).map { |day| make_day day }
end