# Start coverage
autoload :SimpleCov, 'simplecov'

SimpleCov.start

# Load database
autoload :LoadDB, 'models/load_db'
LoadDB.run(environment: ENV['RAILS_ENV'])

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

require_all 'spec/**/**_spec.rb'