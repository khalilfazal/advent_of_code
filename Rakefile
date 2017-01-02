require 'ruby-prof/task'
require 'rspec/core/rake_task'
require 'standalone_migrations'

# spec
spec = RSpec::Core::RakeTask.new
spec.pattern = '**/{spec_*,*_spec,support/*}.rb'
spec.rspec_opts = '--tag ~speed:slow'

# profile
RubyProf::ProfileTask.new do |t|
  t.test_files = FileList['**/{spec_*,*_spec}.rb']
  t.min_percent = 0
  t.output_dir = 'profiles/html'
  t.printer = :graph_html
  t.ruby_opts = ['-I app -I spec -r rspec -r require_all']
end

# stats
task :stats do
  require 'rails/code_statistics'

  ::STATS_DIRECTORIES << %w(Specs spec/)
  CodeStatistics::TEST_TYPES << 'Specs'
end

# db
StandaloneMigrations::Tasks.load_tasks