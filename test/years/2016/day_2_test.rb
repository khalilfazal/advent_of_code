require 'adventofcode/years/2016/day_2'
require 'monkey_patches/assertions'

include Adventofcode::Year_2016::Day_2

class Adventofcode::Year_2016::Day_2_Test < Test::Unit::TestCase
  def test_example_1
    assert_equal_strings '1985', Keypad.bathroom_code(%w(ULL RRDDD LURDL UUUUD))
  end
end