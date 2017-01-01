require 'advent_of_code'
require 'helpers/match_string'
require_all 'lib/advent_of_code/year_2016/day_06/*'

# noinspection RubyResolve
include AdventOfCode::Year2016

# noinspection RubyResolve
describe Day6 do
  let (:input) { @input ||= described_class::input.lines }
  let (:example) { %w(
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
  ) }

  context 'examples and stars' do
    subject { Noise }

    it 'example 1' do
      # noinspection RubyResolve
      expect(subject.unscramble example).to be_identical_to_string 'easter'
    end

    it 'test 1' do
      # noinspection RubyResolve
      expect(subject.unscramble input).to be_identical_to_string 'qrqlznrl'
    end

    it 'example 2' do
      # noinspection RubyResolve
      expect(subject.unscramble2 example).to be_identical_to_string 'advent'
    end

    it 'test 2' do
      # noinspection RubyResolve
      expect(subject.unscramble2 input).to be_identical_to_string 'kgzdfaon'
    end
  end
end