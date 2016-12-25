require 'bundler/gem_tasks'
require 'monkey_patches/array'
require 'rspec/core/rake_task'
require 'ruby-prof/task'
require 'standalone_migrations'

# spec
RSpec::Core::RakeTask.new.pattern = '**/{spec_*,*_spec,support/*}.rb'

# profile
RubyProf::ProfileTask.new do |t|
  t.test_files = FileList['**/{spec_*,*_spec}.rb']
  t.min_percent = 0
end

# db
StandaloneMigrations::Tasks.load_tasks