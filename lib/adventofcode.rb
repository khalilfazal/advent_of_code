require 'adventofcode/version'
require 'monkey_patches/hash'
require 'monkey_patches/time'
require 'open-uri'

module Adventofcode
  COOKIE = {
      session: '***REMOVED***'
  }.make_cookie

  private_constant :COOKIE

  private

  def self.get_input(year = nil, day = nil)
    if year.nil? || day.nil?
      time = Time.new
      year = time.year if year.nil?
      day  = time.advent_day if day.nil?
    end

    open("http://adventofcode.com/#{year}/day/#{day}/input", 'Cookie' => COOKIE).read
  end
end