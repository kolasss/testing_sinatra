require_relative 'home'
MyApp::App.register MyApp::Routes::Home

require_relative 'posts'
MyApp::App.register MyApp::Routes::Posts