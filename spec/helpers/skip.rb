autoload :Boolean, 'helpers/boolean'
autoload :SocketError, 'socket'

# methods that can bee used to skip test cases on exceptions
module Skip
  # skip when +SocketError+ is raised
  #
  # @param enabled Boolean
  # @block example
  #
  # @return Boolean | Exception
  def skip_this_when_dced(enabled: true, &example)
    skip_this_when enabled: enabled, expected_exception: SocketError, &example
  end

  # skip when +Errno::ENOENT+ is raised
  #
  # @param enabled Boolean
  # @block example
  #
  # @return Boolean | Exception
  def skip_this_when_file_not_found(enabled: true, &example)
    skip_this_when enabled: enabled, expected_exception: Errno::ENOENT, &example
  end

  private

  # skip when +expected_exception+ is raised
  #
  # @param enabled Boolean
  # @param expected_exception Exception
  # @block example
  #
  # @return Boolean | Exception
  def skip_this_when(enabled:, expected_exception:, &example)
    example.call
  rescue expected_exception => e
    e.tap do
      skip e.message if enabled && e.is_a?(expected_exception)
    end
  end
end

RSpec.configure do |c|
  c.include Skip
end