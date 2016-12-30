RSpec::Matchers.define :be_skipping_with do |expected = StandardError|
  # @return TrueClass
  def supports_block_expectations?
    true
  end

  match do |actual|
    exception = nil

    RSpec.describe do
      it { exception = actual.call }
    end.run

    RSpec.world.example_groups.pop

    expect(exception).to be_a(expected)
  end
end

RSpec::Matchers.define :be_skipping do
  # @return TrueClass
  def supports_block_expectations?
    true
  end

  match do
    be_skipping_with
  end
end