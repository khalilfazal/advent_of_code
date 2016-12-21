require 'adventofcode/version'
require 'models/input'
require 'monkey_patches/array'
require 'open-uri'

ActiveRecord::Base.establish_connection(
    adapter:  'sqlite3',
    database: 'db/db.sqlite3'
)

class Adventofcode
  def self.get_input(year:, day:)
    row = Input.find_by(year: year, day: day)

    if row.nil?
      input = open("http://adventofcode.com/#{year}/day/#{day}/input", 'Cookie' => COOKIE).read
      Input.create(year: year, day: day, input: input)
      input
    else
      row.input
    end
  end

  private

  def self.get_cookie
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

  COOKIE ||= get_cookie

  private_constant :COOKIE
end