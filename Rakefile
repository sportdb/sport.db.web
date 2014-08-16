require 'hoe'
require './lib/sportweb/version.rb'
require './lib/sportweb/deps.rb'

##############
# note:
#  to release
#   $ rake install_gem   # install new version **local-only** first
#   $ bundle update      # update Gemfile.lock  w/ new local version
#
#   now ready to release


## puts "Gemfile.lock deps:"
## pp SportWeb.deps


Hoe.spec 'sportweb' do

  self.version = SportWeb::VERSION

  self.summary = 'sportweb - instant open sports web browser command line tool'
  self.description = summary

  self.urls = ['https://github.com/sportdb/sport.db.web.ruby']

  self.author = 'Gerald Bauer'
  self.email = 'opensport@googlegroups.com'

  # switch extension to .markdown for gihub formatting
  self.readme_file = 'README.md'
  self.history_file = 'HISTORY.md'

  self.licenses = ['Public Domain']

  self.extra_deps = SportWeb.deps

  self.spec_extras = {
   :required_ruby_version => '>= 1.9.2'
  }

end
