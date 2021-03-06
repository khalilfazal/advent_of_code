require_all 'lib/advent_of_code/year_2016/day_06/*'

require 'advent_of_code'
require 'helpers/match_string'

# noinspection RubyResolve
describe AdventOfCode::Year2016::Day6 do
  let(:problem) { @problem ||= described_class.problem }
  let(:input) { @input ||= problem.input.lines }

  let(:example) do
    %w(
      eedadn
      drvtee
      eandsr
      raavrd
      atevrs
      tsrnev
      sdttsa
      rasrtv
      nssdts
      ntnada
      svetve
      tesnvt
      vntsnd
      vrdear
      dvrsen
      enarar
    )
  end

  context 'examples and stars' do
    it 'passes example 1' do
      # noinspection RubyResolve
      expect(Noise.unscramble example).to be_identical_to_string 'easter'
    end

    it 'achieves star 1' do
      # noinspection RubyResolve
      skip_this_when_dced do
        expect(Noise.unscramble input).to be_identical_to_string problem.answer 1
      end
    end

    it 'passes example 2' do
      # noinspection RubyResolve
      expect(Noise.unscramble2 example).to be_identical_to_string 'advent'
    end

    it 'achieves star 2' do
      skip_this_when_dced do
        # noinspection RubyResolve
        expect(Noise.unscramble2 input).to be_identical_to_string problem.answer 2
      end
    end
  end
end