require 'pry'
require 'sinatra'
require "sinatra/reloader" if development?
require "sinatra/namespace"
require "sinatra/json"
require_relative  'config/config'
require_relative  'models/post'
require_relative  'routes/posts'

get '/' do
  'Welcome to Ololo!'
end
