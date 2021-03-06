###
# helper to generate gemspec dependencies from Gemfile.lock

#
#  for testing use like:
#   ruby ./script/deps.rb


require 'pp'


require_relative '../lib/sportweb/version'    # get version



module SportWeb


def self.gemfile_path
  # note: do NOT use SportWeb.root  (keep file self-contained)
  # path = File.expand_path(  File.dirname(File.dirname(File.dirname(__FILE__))) )
  # path += "/Gemfile.lock"
  # path
  './Gemfile.lock'
end


def self.deps
  puts "reading gemfile=>>#{gemfile_path}<<..."


  gems = []

  inside_gem_sect = false
  lineno=0
  File.read( gemfile_path ).each_line do |line|
    lineno += 1
    line = line.gsub( "\n", '' ).gsub( "\f", '' )  ## remove newlines

    if line =~ /^GEM/
      # GEM section marker
      inside_gem_sect = true
    elsif line =~ /^(PLATFORMS|DEPENDENCIES)/
      # section marker
      inside_gem_sect = false
    else
      if inside_gem_sect
        if line =~ /^\s{4}([a-z][a-z0-9_\-]+)\s\(([^)]+)\)/
          ## puts "  gem  >>#{$1}<<  >>#{$2}<<"

          if $1 == 'sportweb'
            if $2 != VERSION
              puts " *** error: gemfile includes out-of-date sportweb version #{$2} != #{VERSION}"
            end
          else
            name    = $1.dup
            version = $2.dup
            ## note: cut off platform markers e.g. -x86-mingw32
            ##  e.g. 1.6.8.1-x86-mingw32 => 1.6.8.1
            version = version.sub( '-x86-mingw32', '' )

            gems << [name, "= #{version}"]   ## e.g. ['worlddb','= 1.2.4']
          end

        elsif line =~ /^\s{6}/
          ## skip (sub) gem deps (indented w/ six spaces)
        else
           puts "  warn: skipping line #{lineno} inside GEM section >>#{line}<<"
        end
      else
        # skip line
      end
    end
  end

  gems
end

end # module SportWeb




### for testing

if __FILE__ == $0
  gems = SportWeb.deps
  pp gems
end
