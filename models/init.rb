require 'sequel'
require 'yaml'

database = YAML::load_file(File.join('config/database.yml'))
environment = MyApp::App.settings.environment.to_s
DB = Sequel.connect(database[environment])

Sequel::Model.raise_on_save_failure = false
Sequel::Model.plugin :json_serializer

require_relative 'post'