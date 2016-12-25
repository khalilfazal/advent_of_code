require 'standalone_migrations'

# stats
task :stats do
  require 'rails/code_statistics'

  ::STATS_DIRECTORIES << %w(Specs spec/)
  CodeStatistics::TEST_TYPES << 'Specs'
end

# db
StandaloneMigrations::Tasks.load_tasks