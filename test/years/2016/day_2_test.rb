require 'adventofcode/years/2016/day_2'
require 'monkey_patches/omission'

include Adventofcode::Year_2016::Day_2

class Adventofcode::Year_2016::Day_2_Test < Test::Unit::TestCase
  def test_example_1
    assert_equal 1985, Keypad.bathroom_code(%w(ULL RRDDD LURDL UUUUD))
  end

  def test_1
    omit_when_dc do
      assert_equal 76792, Keypad.bathroom_code
    end
  end
end