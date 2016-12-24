require 'advent_of_code'
require 'helpers/match_string'
require 'helpers/skip'
require 'helpers/within_block_is_expected'
require 'monkey_patches/basic_object'

include AdventOfCode

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end