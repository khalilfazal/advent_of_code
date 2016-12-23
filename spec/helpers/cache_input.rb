module CacheInput

  MODULE_REGEX = /[_A-Za-z][_A-Za-z0-9]*/

  def cache_input
    day = /Day(\d+)(?:::#{MODULE_REGEX})*$/.match(self.class.name)[1]

    Object.const_get("Day#{day}").input
  end
end

RSpec.configure do |config|
  config.include CacheInput
end