require 'advent_of_code'
require 'helpers/match_string'
require 'helpers/skip'
require 'helpers/within_block_is_expected'

if ENV['CI']
  require 'codeclimate-test-reporter'
  CodeClimate::TestReporter.start
else
  require 'simplecov'
  SimpleCov.start
end

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
