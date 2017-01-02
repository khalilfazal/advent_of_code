require 'advent_of_code'
require_all 'lib/advent_of_code/year_2016/day_02/*'

# noinspection RubyResolve
include AdventOfCode::Year2016

# noinspection RubyResolve
describe Day2 do
  let(:input) { @input ||= described_class.input }

  let(:example_input) do
    %w(
      ULL
      RRDDD
      LURDL
      UUUUD
    ).unlines
  end

  let(:actual_layout) do
    [
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
      # noinspection RubyResolve
      expect(subject.bathroom_code example_input).to be_identical_to_string '1985'
    end

    it 'star 1' do
      # noinspection RubyResolve
      skip_this_when_dced { expect(subject.bathroom_code input).to be_identical_to_string '76792' }
    end

    it 'example 2' do
      # noinspection RubyResolve
      expect(subject.bathroom_code example_input, actual_layout).to be_identical_to_string '5DB3'
    end

    it 'star 2' do
      # noinspection RubyResolve
      skip_this_when_dced { expect(subject.bathroom_code input, actual_layout).to be_identical_to_string 'A7AC3' }
    end

    it 'catches invalid instructions' do
      expect { subject.bathroom_code 'X' }.to raise_exception ParseError
    end
  end
end