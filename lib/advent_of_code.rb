autoload :AdventProblem, 'models/advent_problem'
autoload :YAML, 'yaml'

require 'monkey_patches/object'
require 'monkey_patches/time'
require 'open-uri'

# Retrieves input from http://adventofcode.com
# Queries and creates Advent Problems
module AdventOfCode
  module_function

  # Preemptively throw a mock 404 error without using any resources if there is no problem for that date.
  # if the problem doesn't exist in the table or if it does but the input is nil, fetch the input from the website.
  #
  # @param date Hash[Symbol, Integer]
  #
  # @return AdventProblem
  def problem(date)
    raise OpenURI::HTTPError.new '404 Not Found', nil unless now.valid_advent_date? date

    logger = Logger.new($stdout)
    logger.info [:default_external, Encoding::default_external]
    logger.info [:default_internal, Encoding::default_internal]

    AdventProblem.find_or_create_by!(date).tap do |problem|
      if problem.input.nil?
        problem.update input: open(problem_url(date), 'Cookie' => cookie).read
      end
    end
  end

  # Builds the url for a problem
  #
  # @param year Integer
  # @param day Integer
  #
  # @return String
  def problem_url(year:, day:)
    "http://adventofcode.com/#{year}/day/#{day}/input"
  end

  # @return Time
  def now
    @now ||= Time.current
  end

  # @return String
  def cookie
    @cookie ||= (ENV['ADVENT_OF_CODE_COOKIE'] || YAML.load_file('config/application.yml')['cookie']).tap do |cookie|
      if cookie.nil?
        raise StandardError, "Set ENV['ADVENT_OF_CODE_COOKIE'] or place your session cookie into config/application.yml"
      end
    end
  end

  # Create a module for a year
  #
  # @param year Integer
  #
  # @return Module
  def make_year(year)
    define_module "Year#{year}" do
      # Get the problem associated with a day of December in this year
      #
      # @param day Integer
      #
      # @return AdventProblem
      define_singleton_method :problem do |day:|
        parent.problem year: year, day: day
      end

      define_singleton_method :make_day do |day|
        define_module "Day#{day}" do
          # Get the problem associated with this day of December in this year
          #
          # @return AdventProblem
          define_singleton_method :problem do
            parent.problem day: day
          end
        end
      end
    end.tap do |year_module|
      now.advent_days(year: year).each do |day|
        # noinspection RubyResolve
        year_module.make_day day
      end
    end
  end

  now.advent_years.each(&method(:make_year))
end