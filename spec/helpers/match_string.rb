RSpec::Matchers.define :match_string do |expected|
  match do |actual|
    actual === expected && actual.encoding === expected.encoding
  end
end