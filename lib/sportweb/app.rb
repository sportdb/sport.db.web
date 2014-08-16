# encoding: utf-8


puts '[boot] enter sportweb/app.rb'

####
# setup mini-rails
#   see https://gist.github.com/josevalim/1942658
#   and others

### host app - no module - keep it simple
class SportWebHost < Rails::Application

  routes.append do
    match '/hello/world' => 'hello#world'

    ## mount About::Server, :at => '/sysinfo'
    ## mount DbBrowser::Server, :at => '/browse'

    ###
    # mount sinatra app (bundled w/ sportdb-service gem) for json api service
    # todo: add JSON API link to layout
    ## get '/api' => redirect('/api/v1')
    ## mount SportDb::Service::Server, :at => '/api/v1' # NB: make sure to require 'sportdb-service'

    ## mount sinatra app (bundled w/ logutils gem)
    ## mount LogDb::Server, :at => '/logs' # NB: make sure to require 'logutils/server'

    mount SportDbAdmin::Engine, :at => '/'  # mount a root possible?
  end


  # Configure the default encoding used in templates for Ruby 1.9.
  config.encoding = "utf-8"

  # Enable cache classes. Production style.
  config.cache_classes = true

  # We need a secret token for session, cookies, etc.
  config.secret_token = "49837489qkuweoiuoqwehisuakshdjksadhaisdy78o34y138974xyqp9rmye8yrpiokeuioqwzyoiuxftoyqiuxrhm3iou1hrzmjk"


  #################################################
  # Enable the asset pipeline !!!!!!!!!!!!!!!!
  config.assets.enabled = true
  # Version of your assets, change this if you want to expire all your assets
  config.assets.version = '1.0'

  ### Enables Sprockets compile environment.
  ## If disabled, Rails.application.assets will be unavailable
  ## to any ActionView helpers.
  ## View helpers will depend on assets being precompiled
  ## to public/assets in order to link to them.
  ## You can still access the environment
  ## by directly calling Rails.application.assets
  ## config.assets.compile = true
end


# This is a barebone controller. One good reference can be found here:
# http://piotrsarnacki.com/2010/12/12/lightweight-controllers-with-rails3/

class HelloController < ActionController::Metal
  include ActionController::Rendering
 
  def world
    render text: 'Hello world!'
  end
end


####
#  Database Setup & Config
#
# possible w/o  config/database.yml ???
#
#  see stackoverflow.com/questions/4204724/strategies-for-overriding-database-yml
#
#  google for "rails database.yml opt out" ??? 


db_config = {
adapter: 'sqlite3',
database: 'football.db' # NOTE: change to use your db of choice (e.g. worldcup.db, bundesliga.db, ski.db etc.)
}

pp db_config
ActiveRecord::Base.establish_connection( db_config )
## for debugging - disable for production use
ActiveRecord::Base.logger = Logger.new( STDOUT )

### make all SportDb models - top level (e.g. SportDb::Model::Team becomes Team)
include SportDb::Models


puts '[boot] before App.initialize!'
# Initialize the app (originally in config/environment.rb)
SportWebHost.initialize!
puts '[boot] after App.initialize!'



####
# check asset pipeline

puts "Rails.version:     #{Rails.version}"
puts "Rails.env:         #{Rails.env}"
puts "Rails.root:        #{Rails.root}"
puts "Rails.application.class: #{Rails.application.class.name}"
puts "Rails.application.assets.class: #{Rails.application.assets.class.name}"

pp Rails.application.assets

puts ">> Rails asset pipeline:"

if Rails.application.assets.find_asset( "logos/24x24/austria.png" ).present?
  puts "asset 'logos/24x24/austria.png' found"
else
  puts "asset 'logos/24x24/austria.png' not found"
end


# Print the stack for fun!
puts ">> Starting Rails stack:"
Rails.configuration.middleware.each do |middleware|
  puts "use #{middleware.inspect}"
end

## # Run it (originally in config.ru)
## run MyApp



puts '[boot] leave sportweb/app.rb'
