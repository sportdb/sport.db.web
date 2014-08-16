# encoding: utf-8

###
#  test run like:
#    $ ruby -I ./lib ./lib/sportdb/browse.rb



require 'sportdb/browse/boot_with_bundler'


puts 'hello'



app = Rack::Builder.new {
  ### use Rails::Rack::Static

  # Anything urls starting with /tiny will go to Sinatra
  ### map "/tiny" do
  ##  run Sinatra.application
  ### end

  map '/db' do
    run SportDbAdmin::Engine
  end


  # Rest with Rails
  map '/' do
    run SportDbBrowser
  end
  
}.to_app


puts 'before Thin.run app'
Rack::Handler::Thin.run app, :Port => 3000, :Host => '0.0.0.0'
puts 'after Thin.run app'

puts 'bye'
