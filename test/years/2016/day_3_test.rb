require_all 'lib/adventofcode/years/2016/day_3/*'

class Day_3_Test < Test::Unit::TestCase
  def test_1
    assert_equal 869, Triangle.validate
  end
end