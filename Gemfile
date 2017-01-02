source 'https://rubygems.org'

# TODO: Move to 2.4
# Blocking: RubyMines doesn't work with 2.4 yet
# Remove monkey_patches/comparable.rb after moving to 2.4
ruby '2.3.3'

# gems needed for running all files in lib
group :runtime do
  gem 'activerecord', '~> 5.0', '>= 5.0.1'
  gem 'sqlite3', '~> 1.3', '>= 1.3.12'

  # standalone_migrations (5.0.0) depends on rake (~> 10.0)
  # gem 'rake', '~> 12.0'
  gem 'rake', '~> 10.0'
  gem 'standalone_migrations', '~> 5.0'
end

# gems needed for testing, inspections, profiling and coverage
group :test do
  gem 'codeclimate-test-reporter', '~> 1.0', '>= 1.0.4'
  gem 'require_all', '~> 1.3', '>= 1.3.3'
  gem 'rspec', '~> 3.5'
  gem 'rspec-prof', '~> 0.0.7'
  gem 'rubocop', '~> 0.46.0'
  gem 'ruby-prof', '~> 0.16.2'
  gem 'simplecov', '~> 0.12.0'
end

# gems needed for both development and testing
group :test do
  gem 'fuubar', '~> 2.2'
end

# Specify your gem's dependencies in advent_of_code.gemspec
gemspec