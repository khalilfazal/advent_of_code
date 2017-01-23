require 'standalone_migrations'

# spec
task :spec do
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new.pattern = 'spec/helpers/spec_helper.rb'
end

# profile
task :profile do
  require 'ruby-prof/task'

  RubyProf::ProfileTask.new do |t|
    t.test_files = FileList['spec/helpers/spec_helper.rb']
    t.min_percent = 0
    t.output_dir = 'profiles/html'
    t.printer = :graph_html
    t.ruby_opts = ['-I app -I spec -r rspec -r require_all']
  end
end

# stats
task :stats do
  require 'rails/code_statistics'

  [%w(DB db), %w(Specs spec)].each do |dir|
    ::STATS_DIRECTORIES << dir
    CodeStatistics::TEST_TYPES << dir[0]
  end
end

# db
StandaloneMigrations::Tasks.load_tasks

# truncate
namespace :db do
  desc 'Truncate all existing data'
  task truncate: 'db:load_config' do
    ActiveRecord::Base.tap do |base|
      base.establish_connection

      base.connection.tap do |connection|
        connection.tables.each do |table|
          unless %w(ar_internal_metadata schema_migrations).include? table
            connection.execute %(ALTER SEQUENCE "#{table}_id_seq" RESTART)
            connection.execute "TRUNCATE #{table}"
          end
        end
      end
    end
  end
end