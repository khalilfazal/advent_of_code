require 'monkey_patches/time'

describe Time do
  it "when it's 2016-12-26, advent days are 1 .. 25" do
    expect(described_class.new(2016, 12, 26).advent_days year: 2016).to be === (1 .. 25)
  end
end