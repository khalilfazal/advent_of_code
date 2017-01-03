autoload :ActiveRecord, 'active_record'
autoload :YAML, 'yaml'

# load database
module LoadDB
  module_function

  # @param environment String
  #
  # @return ActiveRecord::ConnectionAdapters::ConnectionPool
  def run(environment:)
    config = YAML.load_file('db/config.yml')
    ActiveRecord::Base.establish_connection(config[environment])
  end
end