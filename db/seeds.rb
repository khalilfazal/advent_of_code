autoload :AdventProblem, 'models/advent_problem'
autoload :JSON, 'json'

JSON.parse(File.read 'db/seeds/solutions.json').each do |h|
  AdventProblem.find_or_create_by!(h.slice 'year', 'day').tap do |problem|
    problem.update solutions: h['solutions'].map(&:inspect)
  end
end