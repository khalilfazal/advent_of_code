autoload :OpenURI, 'open-uri'
autoload :YAML, 'yaml'

require 'advent_of_code'
require 'helpers/within_block_is_expected'

describe AdventOfCode do
  it { within_block_is_expected.not_to raise_exception }

  it 'raises an error when the session cookie can not be determined' do
    # set the +cookie+ instance variable to nil
    described_class.instance_variable_set :@cookie, nil

    # make the environment variable nil
    saved_cookie = ENV['ADVENT_OF_CODE_COOKIE']
    ENV['ADVENT_OF_CODE_COOKIE'] = nil

    # change the behaviour of +YAML+
    allow(YAML).to receive(:load_file).and_return({})

    expect { described_class.cookie }.to raise_error StandardError

    # reset the environment variable
    ENV['ADVENT_OF_CODE_COOKIE'] = saved_cookie
  end

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