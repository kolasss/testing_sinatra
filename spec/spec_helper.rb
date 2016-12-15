ENV['RACK_ENV'] = 'test'

require 'rack/test'
require 'rspec'
require 'factory_girl'
require_relative '../app'

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.around(:each) do |example|
    DB.transaction(:rollback=>:always, :auto_savepoint=>true){example.run}
  end

  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    FactoryGirl.find_definitions
  end
  
  def app
    MyApp::App
  end
end
