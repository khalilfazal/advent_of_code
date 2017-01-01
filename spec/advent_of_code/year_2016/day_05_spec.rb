require 'advent_of_code'
require 'helpers/match_string'
require_all 'lib/advent_of_code/year_2016/day_05/*'

# noinspection RubyResolve
include AdventOfCode::Year2016

# noinspection RubyResolve
describe Day5 do
  let (:input) { @input ||= described_class::input.chomp }
  let (:example) { 'abc' }

  context 'examples and stars' do
    subject { MD5Hasher }

    # Runtime: 19s 239ms
    xit 'example 1' do
      # noinspection RubyResolve
      expect(subject.crack example).to be_identical_to_string '18f47a30'
    end

    # Runtime: 39 622ms
    xit 'test 1' do
      # noinspection RubyResolve
      expect(subject.crack input).to be_identical_to_string '1a3099aa'
    end

    # Runtime: 30s 995ms
    xit 'example 2' do
      # noinspection RubyResolve
      expect(subject.crack2 example).to be_identical_to_string '05ace8e3'
    end

    # Runtime: 57s 813ms
    xit 'test 2' do
      # noinspection RubyResolve
      expect(subject.crack2 input).to be_identical_to_string '694190cd'
    end
  end
end