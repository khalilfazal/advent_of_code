require 'advent_of_code'
require 'advent_of_code/version'
require 'helpers/match_string'

describe AdventOfCode do
  it { within_block_is_expected.not_to raise_exception }

  it "shows error message when cookie.txt doesn't exist" do
    subject.instance_variable_set :@cookie, nil
    expect { subject.read_cookie('foobar.txt') }.to raise_error StandardError
  end

  it 'shows error message when the cookie in cookie.txt is malformed' do
    open('cookie.txt', 'r') do |handle|
      allow(handle).to receive(:read).and_return('bad cookie')
      expect { subject.with_handle(handle) }.to raise_error StandardError
    end
  end

  context '404 Exceptions for an invalid year/day' do
    def expect_input_factory(year:, day:)
      expect { subject.input year: year, day: day }.to raise_error OpenURI::HTTPError
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