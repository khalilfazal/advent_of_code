require 'helpers/match_string'
require 'monkey_patches/string'

describe String do
  it '0 is an integer' do
    expect('0'.to_i!).to be 0
  end

  it "'0' is not an integer" do
    # noinspection RubyResolve
    expect("'0'".to_i!).to be_identical_to_string "'0'"
  end
end