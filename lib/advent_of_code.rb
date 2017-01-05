autoload :AdventProblem, 'models/advent_problem'

require 'monkey_patches/object'
require 'monkey_patches/time'
require 'open-uri'

# Retrieves input from http://adventofcode.com
# Retrieves +@cookie+ from cookie.txt
# Queries and creates Advent Problems
module AdventOfCode
  module_function

  # @param year Integer
  # @param day Integer
  #
  # @return AdventProblem
  def problem(year:, day:)
    # Preemptively throw a mock 404 error without using any resources.
    now = Time.now
    raise OpenURI::HTTPError.new '404 Not Found', nil unless now.valid_advent_year?(year: year) && now.valid_advent_day?(year: year, day: day)

    AdventProblem.find_or_create_by(year: year, day: day).tap do |problem|
      if problem.input.nil?
        problem.update input: open("http://adventofcode.com/#{year}/day/#{day}/input", 'Cookie' => read_cookie).read
      end
    end
  end

  # @param file String
  #
  # @return String
  def read_cookie(file = 'cookie.txt')
    @cookie ||=
      begin
        open(file, 'r', &method(:with_handle))
      rescue SystemCallError
        raise StandardError, [
          'Place your session cookie into cookie.txt',
          'See cookie.txt.sample'
        ].unlines
      end
  end

  # @param handle File
  #
  # @return String
  def with_handle(handle)
    handle.read.tap do |contents|
      raise StandardError, 'cookie.txt contains a badly formed cookie' unless contents =~ /^session=[a-f0-9]+$/
    end
  end

  # @param year Integer
  #
  # @return Module
  def make_year(year)
    define_module "Year#{year}" do
      # @param day Integer
      #
      # @return AdventProblem
      define_singleton_method :problem do |day:|
        parent.problem year: year, day: day
      end

      define_singleton_method :make_day do |day|
        define_module "Day#{day}" do
          # @return AdventProblem
          define_singleton_method :problem do
            parent.problem day: day
          end
        end
      end

      # noinspection RubyResolve
      Time.now.advent_days(year: year).each(&method(:make_day))
    end
  end

  Time.now.advent_years.each(&method(:make_year))
end