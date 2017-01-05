autoload :AdventProblem, 'models/advent_problem'
autoload :YAML, 'yaml'

# noinspection RubyResolve
YAML.load(File.read 'db/seeds/answers.yml')['years'].each do |year|
  year_id = year['year']

  year['days'].each do |day|
    AdventProblem.seed year: year_id, day: day['day'], answers: day['answers']
  end
end