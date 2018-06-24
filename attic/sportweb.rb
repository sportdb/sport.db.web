
## note: run SportWebHost as main app for now (no rack builder wrapper needed; a rails app is a rack app)
app = Rack::Builder.new {
 ### use Rails::Rack::Static

# Anything urls starting with /tiny will go to Sinatra
### map "/tiny" do
##  run Sinatra.application
### end

  ##  map '/' do
  ##    run SportDbAdmin::Engine
  ##  end

  # Rest with "Dummy" Rails Host App
  map '/' do
    run SportWebHost
  end

}.to_app



## note: switch to puma from thin; puma is new rails5 standard/default
Rack::Handler::Thin.run app, :Port => 3000, :Host => '0.0.0.0'
