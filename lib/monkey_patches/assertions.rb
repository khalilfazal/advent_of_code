module Test::Unit::Assertions
  def assert_equal_strings(expected, actual, message = nil)
    assert_equal(expected, actual, message)
    assert_equal(expected.encoding, actual.encoding, message)
  end
end