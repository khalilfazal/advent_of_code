require 'socket'

module Skip
  def skip_this_when_dced(enabled: true, &example)
    skip_this_when(enabled: enabled, exception: SocketError, &example)
  end

  def skip_this_when_file_not_found(enabled: true, &example)
    skip_this_when(enabled: enabled, exception: Errno::ENOENT, &example)
  end

  private

  def skip_this_when(enabled:, exception:, &example)
    result = nil

    begin
      example.call
    rescue exception => e
      result = e
      skip (yield e) if enabled
    end

    result
  end
end

RSpec.configure do |c|
  c.include Skip
end