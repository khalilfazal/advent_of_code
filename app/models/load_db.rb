require 'active_record'
require 'yaml'

def load_db(environment:)
  config = YAML.load_file('db/config.yml')
  ActiveRecord::Base.establish_connection(config[environment])
end