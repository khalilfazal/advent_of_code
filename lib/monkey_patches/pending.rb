module RSpec::Core::Pending
  def skip_when_dced
    begin
      yield
    rescue SocketError
      skip 'skipped due to network issues'
    end
  end
end