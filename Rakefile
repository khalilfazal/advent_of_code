require 'bundler/gem_tasks'
require 'monkey_patches/array'
require 'rspec/core/rake_task'
require 'ruby-prof/task'
require 'standalone_migrations'

gems = [
    [:require_all, :rspec, :set].join_with_prefix('-r ', ' '),
    [:app, :spec].join_with_prefix('-I ', ' ')
].join ' '

# rspec
RSpec::Core::RakeTask.new(:spec).ruby_opts = gems

# profile
RubyProf::ProfileTask.new do |t|
  t.test_files = FileList['spec/**/*_spec.rb']
  t.output_dir = 'profiles'
  t.printer = :dot
  t.ruby_opts = Array.singleton gems
  t.min_percent = 0
end

# db
StandaloneMigrations::Tasks.load_tasks