require 'adventofcode/years/2016/day_2'
require 'monkey_patches/omission'
require 'monkey_patches/assertions'

include Adventofcode::Year_2016::Day_2

class Adventofcode::Year_2016::Day_2_Test < Test::Unit::TestCase
  def initialize(test_case_class)
    super(test_case_class)

    @example_instructions = %w(
      ULL
      RRDDD
      LURDL
      UUUUD
    ).join "\n"

    @actual_layout = [
        '  1  ',
        ' 234 ',
        '56789',
        ' ABC ',
        '  D  '
    ].join
  end

  def test_example_1
    assert_equal_strings '1985', Keypad.bathroom_code(instructions: @example_instructions)
  end

  def test_1
    omit_when_dced do
      assert_equal_strings '76792', Keypad.bathroom_code
    end
  end

  def test_example_2
    assert_equal_strings '5DB3', Keypad.bathroom_code(instructions: @example_instructions, layout: @actual_layout)
  end

  def test_2
    omit_when_dced do
      assert_equal_strings 'A7AC3', Keypad.bathroom_code(layout: @actual_layout)
    end
  end
end