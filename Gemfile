source 'https://rubygems.org'


## gem 'rails', '5.2.0'
## note: use rails deps w/o:
##   actioncable and
##   actionmailer    -- include? why? why not?
##   activestorage   -- include? why? why not?
##
##  exclude activejob too - why? why not?


gem 'actionpack',    '5.2.0', require: false
gem 'actionview',    '5.2.0', require: false
gem 'activejob',     '5.2.0', require: false
gem 'activemodel',   '5.2.0', require: false
gem 'activerecord',  '5.2.0', require: false
gem 'activesupport', '5.2.0', require: false
gem 'railties',      '5.2.0', require: false

gem 'sprockets-rails', '>= 2.0.0',   require: false
gem 'bundler',       '>= 1.3.0',    require: false



gem 'sinatra', require: 'sinatra/base'


gem 'sqlite3'   # database - use (embedded) sqlite database

### gem 'thin'      # webserver - use thin web server
gem 'puma'      ## try puma web server for rails 5 ??


### rails asset addons
## gem 'actionpack',         require: 'action_controller/railtie'  ## needed by sprockets-rails
## gem 'sprockets-rails',    require: 'sprockets/railtie'


gem 'sass-rails'    ##  , '~> 5.0'  ## todo/check -- require  sass-rails/railtie ??
gem 'jquery-rails'   ## todo/check -- require jquery-rails/railtie ?? to activate?



############
# lets use open sport.db schema & fixtures

gem 'logutils'   ###, '0.6.0'
gem 'logutils-activerecord'     # LogDb n LogDb::Models
gem 'props'
gem 'props-activerecord'        # ConfDb n ConfDb::Models

gem 'worlddb-models'  ## , '2.3.4'
gem 'sportdb-models'  ## , '1.16.2'
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


################################
## note: for release exclude for now dev rails gems
## gem 'web-console' ## , '~> 2.0'
## gem 'byebug'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]



#############
#  note:
#    todo/check/fix: needs to include itself too!!!!!!  - why? sportweb has no deps itself its a host rails app
#
#    check version
#    must match latest!!! - try bundle update before release ???

## gem 'sportweb'
