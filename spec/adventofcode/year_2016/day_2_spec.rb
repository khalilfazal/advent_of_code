require_all 'lib/advent_of_code/year_2016/day_2/*'
require 'helpers/cache_input'
require 'helpers/match_string'
require 'helpers/skip'
require 'monkey_patches/array'

describe 'Year2016::Day2' do
  before :all do
    @input = cache_input

    @example_input = %w(
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

  context 'examples and stars' do
    subject { Keypad }

    it 'example 1' do
      expect(subject.bathroom_code @example_input).to be_identical_to_string '1985'
    end

    it 'star 1' do
      skip_this_on_network_error { expect(subject.bathroom_code @input).to be_identical_to_string '76792' }
    end

    it 'example 2' do
      expect(subject.bathroom_code @example_input, @actual_layout).to be_identical_to_string '5DB3'
    end

    it 'star 2' do
      skip_this_on_network_error { expect(subject.bathroom_code @input, @actual_layout).to be_identical_to_string 'A7AC3' }
    end

    it 'raises AdventOfCode::InputError when instructions are invalid' do
      expect { subject.bathroom_code 'X' }.to raise_exception AdventOfCode::InputError
    end
  end
end