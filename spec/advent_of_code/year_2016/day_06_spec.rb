require_all 'lib/advent_of_code/year_2016/day_06/*'

require 'advent_of_code'

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
    subject { Noise }

    it 'passes example 1' do
      # noinspection RubyResolve
      expect(subject.unscramble example).to be_identical_to_string 'easter'
    end

    it 'achieves star 1' do
      # noinspection RubyResolve
      skip_this_when_dced do
        expect(subject.unscramble input).to be_identical_to_string 'qrqlznrl'
      end
    end

    it 'passes example 2' do
      # noinspection RubyResolve
      expect(subject.unscramble2 example).to be_identical_to_string 'advent'
    end

    it 'achieves star 2' do
      skip_this_when_dced do
        # noinspection RubyResolve
        expect(subject.unscramble2 input).to be_identical_to_string 'kgzdfaon'
      end
    end
  end
end