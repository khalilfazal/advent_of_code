require 'adventofcode/version'
require 'monkey_patches/array'
require 'open-uri'

module Adventofcode
  def self.get_input(year:, day:)
    open("http://adventofcode.com/#{year}/day/#{day}/input", 'Cookie' => COOKIE).read
  end

  COOKIE =
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

  private_constant :COOKIE
end