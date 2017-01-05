source 'https://rubygems.org'

ruby '2.4.0'

# gems needed for running all files in lib
group :runtime do
  gem 'pg', '~> 0.19.0'

  # +standalone_migrations+ (5.0.0) depends on +rake+ (~> 10.0)
  # gem 'rake', '~> 12.0'
  gem 'rake', '~> 10.0'
  gem 'standalone_migrations', '~> 5.0'

  # +activerecord+ (5.1.0.alpha) depends on +arel+ (~> 8.0)
  gem 'arel', git: 'https://github.com/rails/arel.git'

  git 'https://github.com/rails/rails.git' do
    # next version after 5.0.1 solves this problem: https://github.com/rails/rails/commit/cb0452e9a50e97f8ab2100f6226fbdd47a970a34
    gem 'activerecord' # , '~> 5.0', '>= 5.0.1'
  end
end

# gems needed for testing, inspections, profiling and coverage
group :test do
  gem 'codeclimate-test-reporter', '~> 1.0', '>= 1.0.4'
  gem 'database_cleaner', '~> 1.5', '>= 1.5.3'
  gem 'fuubar', '~> 2.2'
  gem 'require_all', '~> 1.3', '>= 1.3.3'
  gem 'rspec', '~> 3.5'
  gem 'rspec-prof', '~> 0.0.7'
  gem 'rubocop', '~> 0.46.0'
  gem 'ruby-graphviz', git: 'https://github.com/khalilfazal/Ruby-Graphviz.git'
  gem 'ruby-prof', '~> 0.16.2'

  # next version after 0.12 solves this problem: https://github.com/colszowka/simplecov/commit/050eb6830440bf998c462aee219f8b3cd17d570f
  gem 'simplecov', git: 'https://github.com/colszowka/simplecov.git' # , '~> 0.12.0'

  # +debase+ 0.2.2 has this bug: https://intellij-support.jetbrains.com/hc/en-us/community/posts/203374210-Problem-debugging-with-Rubymine
  gem 'debase', '~> 0.2.1'
end

gemspec