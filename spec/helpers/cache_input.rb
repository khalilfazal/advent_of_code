module CacheInput

  MODULE_REGEX = /[_A-Za-z][_A-Za-z0-9]*/

  def cache_input
    day = /(\d+)::#{MODULE_REGEX}$/.match(self.class.name)[1]

    begin
      Object.const_get("Day#{day}").input
    rescue SocketError
      nil
    end
  end
end

RSpec.configure do |config|
  config.include CacheInput
end