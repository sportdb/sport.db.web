# encoding: utf-8

puts '[boot] enter boot_with_bundler.rb'


ENV['RACK_ENV'] ||= 'development'
puts "ENV['RACK_ENV'] = #{ENV['RACK_ENV']}"

puts '[boot] before require bundler'
require 'bundler'
puts '[boot] after require bundler'


# ruby core n stdlibs
require 'json'
require 'uri'
require 'logger'
require 'pp'


# 3rd party gems via bundler (see Gemfile)

puts '[boot] before Bundler.setup'
Bundler.setup
puts '[boot] after Bundler.setup'

puts '[boot] before Bundler.require'
Bundler.require(:default, ENV['RACK_ENV'].to_sym)
puts '[boot] after Bundler.require'

#########
# require rails n rails/all - still needed ??
puts '[boot] before require rails'
require 'rails'
puts '[boot] after require rails'

puts '[boot] before require rails/all'
## note: do NOT load active_record/railtie  - will load database/config ??
##   require it ourself

### require 'rails/all'

###
## gem 'sprockets-rails', :require => 'sprockets/railtie'
##
##  Or alternatively require 'sprockets/railtie' in your config/application.rb if you have Bundler auto-require disabled.

['action_controller',
 'sprockets'].each do |framework|
  begin
    require "#{framework}/railtie"
  rescue LoadError
  end
end

puts '[boot] after require rails/all'


#############
### move require app to sportweb.rb ????

puts '[boot] before require sportweb/app'
require 'sportweb/app'
puts '[boot] after require sportweb/app'



puts '[boot] leave boot_with_bundler.rb'

