require 'test/unit'

module Test::Unit::TestCaseOmissionSupport
  def omit_when_dced
    begin
      yield
    rescue SocketError
      omit 'omitted due to network issues'
    end
  end
end