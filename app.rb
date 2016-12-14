require 'pry'
require 'sinatra/base'
require "sinatra/namespace"
require "sinatra/json"

module MyApp
  class App < Sinatra::Application
    register Sinatra::Namespace

    run! if app_file == $0
  end
end

require_relative  'models/init'
require_relative  'helpers/init'
require_relative  'routes/init'