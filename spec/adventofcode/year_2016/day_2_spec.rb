require_all 'lib/adventofcode/year_2016/day_2/*'
require 'helpers/cache_input'
require 'helpers/match_string.rb'
require 'helpers/skip'
require 'monkey_patches/array'

describe 'Year_2016::Day_2' do
  before :all do
    cache_input

    @example_instructions = %w(
      ULL
      RRDDD
      LURDL
      UUUUD
    ).unlines

    @actual_layout = [
        '  1  ',
        ' 234 ',
        '56789',
        ' ABC ',
        '  D  '
    ].join
  end

  it 'example 1' do
    expect(Keypad.bathroom_code @example_instructions).to match_string('1985')
  end

  it 'star 1' do
    skip_when_dced do
      expect(Keypad.bathroom_code @input).to match_string('76792')
    end
  end

  it 'example 2' do
    expect(Keypad.bathroom_code @example_instructions, @actual_layout).to match_string('5DB3')
  end

  it 'star 2' do
    skip_when_dced do
      expect(Keypad.bathroom_code @input, @actual_layout).to match_string('A7AC3')
    end
  end
end