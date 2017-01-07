require_all 'lib/advent_of_code/year_2016/day_02/*'

require 'advent_of_code'
require 'helpers/match_string'

# noinspection RubyResolve
describe AdventOfCode::Year2016::Day2 do
  let(:problem) { @problem ||= described_class.problem }
  let(:input) { @input ||= problem.input }

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

    it 'passes example 1' do
      # noinspection RubyResolve
      expect(subject.bathroom_code example_input).to be_identical_to_string '1985'
    end

    it 'anchieves star 1' do
      # noinspection RubyResolve
      skip_this_when_dced do
        expect(subject.bathroom_code input).to be_identical_to_string problem.answer 1
      end
    end

    it 'passes example 2' do
      # noinspection RubyResolve
      expect(subject.bathroom_code example_input, actual_layout).to be_identical_to_string '5DB3'
    end

    it 'anchieves star 2' do
      # noinspection RubyResolve
      skip_this_when_dced do
        expect(subject.bathroom_code input, actual_layout).to be_identical_to_string problem.answer 2
      end
    end

    it 'catches invalid instructions' do
      expect { subject.bathroom_code 'X' }.to raise_exception ParseError
    end
  end
end