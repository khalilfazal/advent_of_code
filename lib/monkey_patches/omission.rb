require 'test/unit'

module Test::Unit::TestCaseOmissionSupport
  def omit_when_dc
    begin
      yield
    rescue SocketError
      omit 'omitted due to network issues'
    end
  end
end