require 'bundler/gem_tasks'
require 'monkey_patches/array'
require 'monkey_patches/basic_object'
require 'rspec/core/rake_task'
require 'ruby-prof/task'
require 'standalone_migrations'

include = [
    [:require_all, :rspec, :set].join_with_prefix('-r ', ' '),
    [:app, :spec].join_with_prefix('-I ', ' ')
].join ' '

# spec
rspec = RSpec::Core::RakeTask.new
rspec.ruby_opts = include
rspec.rspec_opts = '--color'
rspec.pattern = '**/{spec_*,*_spec, support/*}.rb'

# profile
RubyProf::ProfileTask.new do |t|
  t.test_files = FileList['spec/**/*_spec.rb']
  t.output_dir = 'profiles'
  t.printer = :graph_html
  t.ruby_opts = include.singleton
  t.min_percent = 0
end

# db
StandaloneMigrations::Tasks.load_tasks