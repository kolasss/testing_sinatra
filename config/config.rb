require 'sequel'
require 'yaml'

DB = Sequel.connect(
  YAML::load_file(File.join('config/database.yml'))[settings.environment.to_s]
)

Sequel::Model.raise_on_save_failure = false
Sequel::Model.plugin :json_serializer
