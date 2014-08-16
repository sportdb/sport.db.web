# encoding: utf-8

###
#  test run like:
#    $ ruby -I ./lib ./lib/sportweb.rb


require 'sportweb/version'   # let version always go first



module SportWeb

  def self.banner
    "sportweb/#{VERSION} on Ruby #{RUBY_VERSION} (#{RUBY_RELEASE_DATE}) [#{RUBY_PLATFORM}]"
  end

  def self.root
    "#{File.expand_path( File.dirname(File.dirname(__FILE__)) )}"
  end
  
  def self.main
    puts 'hello from main'

    require 'sportweb/boot_with_bundler'

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


    #####
    # fix/todo:
    ##   use differnt port ??
    ##
    ##  use --local  for host e.g. 127.0.0.1  insteaod of 0.0.0.0 ???

    puts 'before Thin.run app'
    Rack::Handler::Thin.run app, :Port => 3000, :Host => '0.0.0.0'
    puts 'after Thin.run app'

    puts 'bye'
  end

end # module SportWeb



SportWeb.main  if __FILE__ == $0

