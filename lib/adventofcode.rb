require 'adventofcode/version'
require 'monkey_patches/hash'
require 'open-uri'

module Adventofcode
  COOKIE = {
      session: '***REMOVED***'
  }.make_cookie

  private_constant :COOKIE

  private

  def self.get_input(year:, day:)
    open("http://adventofcode.com/#{year}/day/#{day}/input", 'Cookie' => COOKIE).read
  end
end