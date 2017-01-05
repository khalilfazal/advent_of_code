autoload :Boolean, 'helpers/boolean'
autoload :SimpleCov, 'simplecov'

# Start coverage
module StartCoverage
  module_function

  # @param complete Boolean
  #
  # @return SimpleCov
  def run(complete: false)
    SimpleCov.configure do
      minimum_coverage 100 if complete
      start
    end
  end
end