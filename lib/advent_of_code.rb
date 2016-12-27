require 'advent_of_code/version'
require 'models/input'
require 'monkey_patches/array'
require 'monkey_patches/comparable'
require 'monkey_patches/object'
require 'monkey_patches/time'
require 'open-uri'
require 'racc/parser'

config = YAML.load_file('db/config.yml')
ActiveRecord::Base.establish_connection(config[ENV['RAILS_ENV'] || 'development'])

module AdventOfCode
  private

  # @param year Integer
  # @param day Integer
  #
  # @return String
  def self.input(year:, day:)
    # The first year of Advent of Code was 2015.
    # When year is before 2015, the site will throw a 404 error.
    #
    # Therefore preemptively throw a mock 404 error without using resources.
    raise OpenURI::HTTPError.new '404 Not Found', nil unless year.between?(2015, Time::now.year) && day.between?(1, 25)

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
  def self.read_cookie(file = 'cookie.txt')
    @cookie ||=
        begin
          open(file, 'r') { |handle| with_handle handle }
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
  def self.with_handle(handle)
    contents = handle.read
    raise StandardError, 'cookie.txt contains a badly formed cookie' unless contents =~ /^session=[a-f0-9]+$/
    contents
  end

  # @param year Integer
  #
  # @return Module
  def self.make_year(year)
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
      Time::now.advent_days.map { |day| make_day day }
    end
  end

  Time::now.advent_years.map { |year| make_year year }
end