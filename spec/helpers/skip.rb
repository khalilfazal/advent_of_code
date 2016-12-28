require 'socket'

module Skip
  def skip_this_when_dced(enabled: true, &example)
    skip_this_when(enabled: enabled, expected_exception: SocketError, &example)
  end

  def skip_this_when_file_not_found(enabled: true, &example)
    skip_this_when(enabled: enabled, expected_exception: Errno::ENOENT, &example)
  end

  private

  def skip_this_when(enabled:, expected_exception:, &example)
    actual_exception = nil

    begin
      example.call
    rescue expected_exception => e
      actual_exception = e
      skip e.message if enabled && e.is_a?(expected_exception)
    end

    actual_exception
  end
end

RSpec.configure do |c|
  c.include Skip
end