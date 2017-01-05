# "it within_block_is_expected" is more readable
# than "expect {subject}"
#
# See: https://github.com/rspec/rspec-expectations/issues/805
module WithinBlockIsExpected
  # @return RSpec::Expectations::BlockExpectationTarget
  def within_block_is_expected
    expect { subject }
  end
end

RSpec.configure do |config|
  config.include WithinBlockIsExpected
end