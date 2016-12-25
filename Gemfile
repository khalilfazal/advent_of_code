source 'https://rubygems.org'

group :runtime do
  gem 'activerecord', '~> 5.0', '>= 5.0.1'
  gem 'require_all', '~> 1.3'
  gem 'rspec', '~> 3.5'
  gem 'sqlite3', '~> 1.3'

  # standalone_migrations (5.0.0) depends on rake (~> 10.0)
  gem 'rake', '~> 10.0'
  gem 'standalone_migrations', '~> 5.0'
end

group :test do
  gem 'rspec-prof', '~> 0.0.7'
  gem 'ruby-prof', '~> 0.16.2'
  gem 'simplecov', '~> 0.12'
end

group :development, :test do
  gem 'fuubar'
end

# Specify your gem's dependencies in advent_of_code.gemspec
gemspec