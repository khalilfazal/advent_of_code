require 'socket'

module Skip
  def skip_this_on_network_error
    begin
      yield
    rescue SocketError
      skip 'skipped due to network issues'
    end
  end
end

RSpec.configure do |c|
  c.include Skip
end