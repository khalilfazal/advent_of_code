=begin
require 'advent_of_code'
require 'helpers/match_string'
require 'helpers/skip'
require 'helpers/within_block_is_expected'
=end

# start coverage
require 'simplecov'

SimpleCov.start

# create modules and classes that need to be tested
require 'models/advent_problem'
require 'monkey_patches/array'
require 'monkey_patches/object'
require 'monkey_patches/time'
require 'open-uri'
require 'advent_of_code'

# include files and gems needed for specs
require 'helpers/match_string'
require 'helpers/within_block_is_expected'
require 'racc/parser'

# include all years
# noinspection RubyResolve
include AdventOfCode::Year2016

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

require_all 'spec/**/**_spec.rb'