module CacheInput
  def cache_input(day: self.class.name[/[0-9]+$/].to_i)
        begin
          Object.const_get("Day#{day}").input
        rescue SocketError
          nil
        end
  end
end

RSpec.configure do |c|
  c.include CacheInput
end