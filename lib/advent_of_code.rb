require 'advent_of_code/version'
require 'models/input'
require 'monkey_patches/array'
require 'monkey_patches/comparable'
require 'monkey_patches/object'
require 'monkey_patches/time'
require 'open-uri'
require 'racc/parser'
require 'simplecov'

SimpleCov.start

load_db(environment: ENV['RAILS_ENV'])

# retrieves input from http://adventofcode.com
# retrieves cookie from cookie.txt
# queries and creates Input models
module AdventOfCode
  module_function

  # @param year Integer
  # @param day Integer
  #
  # @return String
  def input(year:, day:)
    # The first year of Advent of Code was 2015.
    # When year is before 2015, the site will throw a 404 error.
    #
    # Therefore preemptively throw a mock 404 error without using resources.
    now = Time.now
    raise OpenURI::HTTPError.new '404 Not Found', nil unless now.valid_advent_year?(year: year) && now.valid_advent_day?(year: year, day: day)

    row = Input.find_by year: year, day: day

    if row.nil?
      open("http://adventofcode.com/#{year}/day/#{day}/input", 'Cookie' => read_cookie) do |handle|
        Input.create(year: year, day: day, input: handle.read).input
      end
    else
      row.input
    end
  end

  # @param file String
  #
  # @return String
  def read_cookie(file = 'cookie.txt')
    @cookie ||=
      begin
        open(file, 'r', &method(:with_handle))
      rescue SystemCallError
        raise StandardError, [
          'Place your session cookie into cookie.txt',
          'See cookie.txt.sample'
        ].unlines
      end
  end

  # @param handle File
  #
  # @return String
  def with_handle(handle)
    contents = handle.read
    raise StandardError, 'cookie.txt contains a badly formed cookie' unless contents =~ /^session=[a-f0-9]+$/
    contents
  end

  # @param year Integer
  #
  # @return Module
  def make_year(year)
    define_module "Year#{year}" do
      # @param day Integer
      #
      # @return String
      define_singleton_method :input do |day:|
        parent.input year: year, day: day
      end

      define_singleton_method :make_day do |day|
        define_module "Day#{day}" do
          # @return String
          define_singleton_method :input do
            parent.input day: day
          end
        end
      end

      # noinspection RubyResolve
      Time.now.advent_days(year: year).map(&method(:make_day))
    end
  end

  Time.now.advent_years.map(&method(:make_year))
end
