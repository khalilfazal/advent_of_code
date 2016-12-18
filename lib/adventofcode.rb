require 'adventofcode/version'
require 'monkey_patches/array'
require 'monkey_patches/hash'
require 'monkey_patches/errno'
require 'open-uri'

module Adventofcode
  private

  def self.get_input(year:, day:)
    open("http://adventofcode.com/#{year}/day/#{day}/input", 'Cookie' => COOKIE).read
  end

  def self.get_cookie
    begin
      open('cookie.txt', 'r') do |file|
        contents = file.read

        raise Errno::ENOENT unless contents =~ /^session=[a-f0-9]+$/

        contents
      end
    rescue Errno::ENOENT
      raise StandardError.new [
          'Place your session cookie into cookie.txt',
          'See cookie.txt.sample'
      ].unlines
    end
  end

  COOKIE = Adventofcode.get_cookie

  private_constant :COOKIE
end