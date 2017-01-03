require 'standalone_migrations'

# spec
task :spec do
  require 'rspec/core/rake_task'

  spec = RSpec::Core::RakeTask.new
  spec.pattern = '**/{spec_*,*_spec,support/*}.rb'
end

# profile
task :profile do
  require 'ruby-prof/task'

  RubyProf::ProfileTask.new do |t|
    t.test_files = FileList['**/{spec_*,*_spec}.rb']
    t.min_percent = 0
    t.output_dir = 'profiles/html'
    t.printer = :graph_html
    t.ruby_opts = ['-I app -I spec -r rspec -r require_all']
  end
end

# stats
task :stats do
  require 'rails/code_statistics'

  ::STATS_DIRECTORIES << %w(Specs spec/)
  CodeStatistics::TEST_TYPES << 'Specs'
end

# db
StandaloneMigrations::Tasks.load_tasks

# truncate
namespace :db do
  include ActiveRecord

  desc 'Truncate all existing data'
  task truncate: 'db:load_config' do
    begin
      Base.establish_connection

      Base.connection.tables.each do |table|
        Base.connection.execute("TRUNCATE #{table}")
      end
    end
  end
end