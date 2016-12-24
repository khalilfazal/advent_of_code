module CacheInput
  def cache_input
    day = /\d+$/.match(self.class.name.split(/::/)[-2])[0]

    Object.const_get("Day#{day}").input
  end
end

RSpec.configure do |config|
  config.include CacheInput
end