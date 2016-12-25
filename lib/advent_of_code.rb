require 'advent_of_code/version'
require 'models/input'
require 'monkey_patches/array'
require 'open-uri'
require 'racc/parser'

ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: 'db/db.sqlite3'
)

module AdventOfCode
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

  private

  def self.read_cookie(file = 'cookie.txt')
    @cookie ||=
        begin
          open(file, 'r', &:with_handle)
        rescue SystemCallError
          raise StandardError, [
              'Place your session cookie into cookie.txt',
              'See cookie.txt.sample'
          ].unlines
        end
  end

  def self.with_handle(handle)
    contents = handle.read
    raise StandardError, 'cookie.txt contains a badly formed cookie' unless contents =~ /^session=[a-f0-9]+$/
    contents
  end
end