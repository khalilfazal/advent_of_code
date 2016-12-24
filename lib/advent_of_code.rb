require 'advent_of_code/version'
require 'models/input'
require 'monkey_patches/array'
require 'open-uri'

ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: 'db/db.sqlite3'
)

module AdventOfCode
  class InputError < StandardError
  end

  module_function

  def input(year:, day:)
    # The first year of Advent of Code was 2015.
    # When year is before 2015, the site will throw a 404 error.
    #
    # Therefore preemptively throw a mock 404 error without using resources.
    raise OpenURI::HTTPError.new '404 Not Found', nil unless year > 2014 && day.between?(1, 25)

    row = Input.find_by(year: year, day: day)

    if row.nil?
      input = open("http://adventofcode.com/#{year}/day/#{day}/input", 'Cookie' => cookie).read
      Input.create(year: year, day: day, input: input)
      input
    else
      row.input
    end
  end

  private

  def cookie
    @cookie ||=
        begin
          open('cookie.txt', 'r') do |file|
            contents = file.read

            raise SystemCallError unless contents =~ /^session=[a-f0-9]+$/

            contents
          end
        rescue SystemCallError
          raise StandardError.new [
              'Place your session cookie into cookie.txt',
              'See cookie.txt.sample'
          ].unlines
        end
  end
end