source 'https://rubygems.org'

gem 'rails', '4.2.7.1'

gem 'sinatra', require: 'sinatra/base'


gem 'sqlite3'   # database - use (embedded) sqlite database

gem 'thin'      # webserver - use thin web server


### rails asset addons

gem 'actionpack',         require: 'action_controller/railtie'  ## needed by sprockets-rails
gem 'sprockets-rails',    require: 'sprockets/railtie'


gem 'sass-rails', '~> 5.0'  ## todo/check -- require  sass-rails/railtie ??
gem 'jquery-rails'   ## todo/check -- require jquery-rails/railtie ?? to activate?



############
# lets use open sport.db schema & fixtures

gem 'logutils'   ###, '0.6.0'
gem 'logutils-activerecord'     # LogDb n LogDb::Models
gem 'props'
gem 'props-activerecord'        # ConfDb n ConfDb::Models

gem 'worlddb-models', '2.3.4'
gem 'sportdb-models', '1.16.2'
gem 'datafile'

gem 'sportdb-admin'


########################
## add logos n flags

gem 'worlddb-flags', '0.1.0'  # use bundled country flags

## gem 'sportdb-logos',    '0.1.0',  git: 'https://github.com/sportlogos/sport.db.logos.ruby.git', branch: 'gh-pages'
## gem 'footballdb-logos', '0.1.0',  git: 'https://github.com/sportlogos/football.db.logos.ruby.git', branch: 'gh-pages'


##########
# add sinatra (mountable) app(let)s
## gem 'about' # mountable app - about - sys info pages
## gem 'dbbrowser' # mountable app


## gem 'web-console', '~> 2.0'
## gem 'byebug'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]



#############
#  note:
#   needs to include itself too!!!!!!
#    check version
#    must match latest!!! - try bundle update before release ???

## gem 'sportweb'
