autoload :ActiveRecord, 'active_record'
autoload :YAML, 'yaml'

module LoadDB
  module_function

  def run(environment:)
    config = YAML.load_file('db/config.yml')
    ActiveRecord::Base.establish_connection(config[environment])
  end
end