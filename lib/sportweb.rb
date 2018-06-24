# encoding: utf-8

###
#  test run like:
#    $ ruby -I ./lib ./lib/sportweb.rb


require 'sportweb/version'   # let version always go first



module SportWeb

  def self.main
    puts 'hello from main'

    require 'sportweb/boot_with_bundler'

    #####
    # fix/todo:
    ##   use differnt port ??
    ##
    ##  use --local  for host e.g. 127.0.0.1  insteaod of 0.0.0.0 ???

    puts 'before Puma.run app'
    require 'rack/handler/puma'
    Rack::Handler::Puma.run SportWebHost, :Port => 3000, :Host => '0.0.0.0'
    puts 'after Puma.run app'

    puts 'bye'
  end

end # module SportWeb



SportWeb.main  if __FILE__ == $0
