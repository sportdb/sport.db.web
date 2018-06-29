# encoding: utf-8

require_relative 'application'


####
#  Database Setup & Config
#
# possible w/o  config/database.yml ???
#
#  see stackoverflow.com/questions/4204724/strategies-for-overriding-database-yml
#
#  google for "rails database.yml opt out" ???



if $0.include?( 'rake' )   ## running with rake always use sport.db default
  DB_PATH = 'sport.db'
else
  if ARGV[0]
    DB_PATH = ARGV[0]     ## e.g world.db etc.
  else
    DB_PATH = 'sport.db'
    puts "trying to use default / fallback SQLite database >#{DB_PATH}<"
  end
end


unless File.exist?( DB_PATH )
  puts "*** error - single-file SQLite database >#{DB_PATH}< missing / not found"
  exit 1
end


db_config = {
  adapter: 'sqlite3',
  database: DB_PATH     # NOTE: change to use your db of choice (e.g. worldcup.db, bundesliga.db, ski.db etc.)
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

puts "Rails.public_path:"
pp   Rails.public_path


puts "Rails.version:     #{Rails.version}"
puts "Rails.env:         #{Rails.env}"
puts "Rails.root:        #{Rails.root}"
puts "Rails.application.class: #{Rails.application.class.name}"
puts "Rails.application.assets.class: #{Rails.application.assets.class.name}"

pp Rails.application.assets

if Rails.application.assets
  puts ">> Rails asset pipeline:"

  if Rails.application.assets.find_asset( "logos/24x24/austria.png" ).present?
    puts "asset 'logos/24x24/austria.png' found"
  else
    puts "!!! - asset 'logos/24x24/austria.png' NOT found"
  end

  ## todo/check: include images/ folder - needed no/yes  check - why? why not?
  if Rails.application.assets.find_asset( "flags/24x24/at.png" ).present?
    puts "asset 'flags/24x24/at.png' found"
  else
    puts "!!! - asset 'flags/24x24/at.png' NOT found"
  end
end


# Print the stack for fun!
puts ">> Starting Rails stack:"
Rails.configuration.middleware.each do |middleware|
  puts "use #{middleware.inspect}"
end


Rails.application.paths.keys.each do |k|
   v = Rails.application.paths[ k ]
   puts ">#{k}<:"
   puts "  expanded: #{v.expanded}"
   puts "---"
end


##
## Rails.application.paths['public'] = "#{mkrootwindowsfix(SportWeb.root)}/public"
## puts "public: #{Rails.application.paths['public'].expanded}"
