require_all 'lib/adventofcode/years/2016/day_1/*'
require 'monkey_patches/omission'

include Adventofcode::Year_2016::Day_1

class Adventofcode::Year_2016::Day_1_Test < Test::Unit::TestCase
  def test_left_north
    assert_same Compass::NORTH.left, Compass::WEST
  end

  def test_private_set_neighbours
    assert_raise NoMethodError do
      Compass::NORTH.set_neighbours Compass::WEST, Compass::EAST
    end
  end

  def test_cycle_from
    assert_equal Compass::NORTH.cycle_from, [Compass::NORTH, Compass::EAST, Compass::SOUTH, Compass::WEST]
  end

  def test_origin
    assert_same 0, Point.origin.x
    assert_same 0, Point.origin.y
  end

  def test_example_1
    assert_equal 5, Traveller.blocks_travelled('R2, L3')
  end

  def test_example_2
    assert_equal 2, Traveller.blocks_travelled('R2, R2, R2')
  end

  def test_example_3
    assert_equal 12, Traveller.blocks_travelled('R5, L5, R5, R3')
  end

  def test_1
    omit_when_dced do
      assert_equal 236, Traveller.blocks_travelled
    end
  end

  def test_example_4
    assert_equal 4, Traveller.visited_twice_distance('R8, R4, R4, R8')
  end

  def test_2
    omit_when_dced do
      assert_equal 182, Traveller.visited_twice_distance
    end
  end
end