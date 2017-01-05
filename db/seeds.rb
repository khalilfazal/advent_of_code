autoload :AdventProblem, 'models/advent_problem'
autoload :YAML, 'yaml'

# noinspection RubyResolve
YAML.load(File.read 'db/seeds/answers.yml')['years'].each do |year|
  year['days'].each do |day|
    AdventProblem.seed year.slice('year').merge(day).symbolize_keys
  end
end