autoload :ActiveRecord, 'active_record'
autoload :YAML, 'yaml'

# Load database
module LoadDB
  module_function

  # Loads the database depending on the specified environment
  #
  # @param environment String
  #
  # @return ActiveRecord::ConnectionAdapters::ConnectionPool
  def run(environment:)
    ActiveRecord::Base.establish_connection(YAML.load_file('db/config.yml')[environment])
  end
end