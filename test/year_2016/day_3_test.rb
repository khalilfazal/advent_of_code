require_all 'lib/adventofcode/year_2016/day_3/*'

class Year_2016::Day_3_Test < Test::Unit::TestCase
  def test_1
    assert_equal 869, Triangle.validate_by_rows
  end

  def test_2
    assert_equal 1544, Triangle.validate_by_columns
  end
end