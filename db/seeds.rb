autoload :AdventProblem, 'models/advent_problem'
autoload :YAML, 'yaml'
autoload :StartCoverage, 'start_coverage'

StartCoverage.run

# noinspection RubyResolve
YAML.safe_load(File.read 'db/seeds/answers.yml')['years'].each do |year|
  year['days'].each do |day|
    AdventProblem.seed year.slice('year').merge(day).symbolize_keys
  end
end