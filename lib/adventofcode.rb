require 'open-uri'

require 'adventofcode/version'

module Adventofcode
  COOKIE = {
      session: '***REMOVED***'
  }.map do |name, value|
    "#{name}=#{value}"
  end.join ';'

  private_constant :COOKIE

  def open_uri(uri)
    open(uri, 'Cookie' => COOKIE).read
  end
end