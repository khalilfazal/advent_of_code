autoload :OpenURI, 'open-uri'
require 'advent_of_code'
require 'helpers/within_block_is_expected'

describe AdventOfCode do
  it { within_block_is_expected.not_to raise_exception }

  context '404 Exceptions for an invalid year/day' do
    def expect_input_factory(year:, day:)
      expect { subject.problem(year: year, day: day).input }.to raise_error OpenURI::HTTPError
    end

    it 'throws a 404 Exception when year is negative' do
      expect_input_factory year: -1, day: 1
    end

    it 'throws a 404 Exception when year < 2015' do
      expect_input_factory year: 2014, day: 1
    end

    it 'throws a 404 Exception when day is negative' do
      expect_input_factory year: 2015, day: -1
    end

    it 'throws a 404 Exception when day is 0' do
      expect_input_factory year: 2015, day: 0
    end

    it 'throws a 404 Exception when day is > 25' do
      expect_input_factory year: 2015, day: 26
    end
  end
end