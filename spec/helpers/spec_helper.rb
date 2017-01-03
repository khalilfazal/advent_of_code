require 'advent_of_code'
require 'helpers/match_string'
require 'helpers/skip'
require 'helpers/within_block_is_expected'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end