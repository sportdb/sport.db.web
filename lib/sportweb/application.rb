# encoding: utf-8

## note: use rails boot conventions e.g.
##    1) config/boot.rb         =>   sportweb/boot_with_bundler.rb
##    2) config/application.rb  =>   sportweb/application.rb
##    3) config/environment.rb  =>   sportweb/environment.rb  (connects to database, init app)


require_relative 'boot_with_bundler'


puts '[boot] enter sportweb/application.rb'


##
# monkey patch image helpers

module ImageHelperExtension
  def logo_for_team( team )
    puts "*** image_helper/logo_for_team #{team.key}"
    ## super  # old_logo_for_team( team )
    ''
  end

  def flag_for_country( country )
    puts "*** image_helper/flag_for_country #{country.key}"
    if country.key == 'eng'
      ## quick fix/hack: eng=>en
      puts "*** use eng quick fix"
      # image_tag( "flags/24x24/en.png" )
      ''
    else
      ## super  # old_flag_for_country( country )
      ''
    end
  end
end

module SportDbAdmin
  module ImageHelper
    prepend ImageHelperExtension
  end # module ImageHelperExtension
end # module SportDbAdmin




####
# setup mini-rails
#   see https://gist.github.com/josevalim/1942658
#   and others


def mkrootwindowsfix( root )
  puts "root: #{root}"
  if root.start_with?( "C:\\" )
    puts "   use: #{root[2..-1]}"
    root[2..-1]   ## cut-of "C:\\"
  else
    root
  end
end


### host app - no module - keep it simple
class SportWebHost < Rails::Application

  routes.append do
    get 'hello/world', to: 'hello#world'


    ## get 'images/flags/*other', to: 'images#flags'
    ## get 'images/logos/*other', to: 'images#logos'

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

  ## config.eager_load = false   ## switch to true - why? why not?  - default for dev is false
  config.eager_load = true


  ##
  # We need a secret token for session, cookies, etc.
  # note: change for rails 5 to secret_key_base (from secret_token)
  config.secret_key_base = "49837489qkuweoiuoqwehisuakshdjksadhaisdy78o34y138974xyqp9rmye8yrpiokeuioqwzyoiuxftoyqiuxrhm3iou1hrzmjk"


  #################################################
  # Enable the asset pipeline !!!!!!!!!!!!!!!!
  ## config.assets.enabled = true
  # Version of your assets, change this if you want to expire all your assets
  config.assets.version = 'v1'
  config.assets.gzip    = false
  ## config.assets.precompile += %w(*.png)

  # config.assets.quiet = false   ## try for debugging to see asset pipeline requests
  # config.assets.check_precompiled_asset = true

  ## config.assets.unknown_asset_fallback = true  ## if not found with asset pipeline; use public as fallback
  ## DEPRECATION WARNING: The asset "flags/24x24/eng.png" is not present in the asset pipeline.Falling back to an asset that may be in the public folder.
  ## This behavior is deprecated and will be removed.
  ## To bypass the asset pipeline and preserve this behavior,
  ## use the `skip_pipeline: true` option.


  ### Enables Sprockets compile environment.
  ## If disabled, Rails.application.assets will be unavailable
  ## to any ActionView helpers.
  ## View helpers will depend on assets being precompiled
  ## to public/assets in order to link to them.
  ## You can still access the environment
  ## by directly calling Rails.application.assets
  config.assets.compile = false


  config.public_file_server.enabled = true


    ## set public path to built-in public
    puts "root (app): #{SportWebHost.root}"
    puts "root (gem): #{SportWeb.root}"
    puts "current:    #{Dir.pwd}"

    paths['public'] = "#{SportWeb.root}/public"
    ## note: gets overwritten!? try again (later) after initialize - why? why not?

    ## test hello path
    paths['hello'] = "#{SportWeb.root}/hello"

    paths['log']    = File.expand_path( "./log/#{Rails.env}.log", mkrootwindowsfix(Dir.pwd) )  ## use working folder for logs
    ## log - check?  is folder/dir or log file itself?
    ##  >log<:
    ##    expanded: ["C:/Sites/sportdb/sport.db.web/log/production.log"]
end


# This is a barebone controller. One good reference can be found here:
# http://piotrsarnacki.com/2010/12/12/lightweight-controllers-with-rails3/

## class HelloController < ActionController::Metal
##  include ActionController::Rendering
class HelloController < ActionController::Base
  def world
    render inline: 'Hello world!'
  end
end




class ImagesController < ActionController::Base
  def flags
    puts "flags params:"
    pp params

     render inline: 'Not found', :status => 404
  end

  def logos
    puts "logos params:"
    pp params

    render inline: 'Not found', :status => 404
  end
end


puts '[boot] leave sportweb/application.rb'
