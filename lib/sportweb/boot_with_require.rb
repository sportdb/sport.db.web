# encoding: utf-8

###
# note: it's an addon to sportdb (get all libs via sportdb)

puts '[boot] before require worlddb'
require 'worlddb'
puts '[boot] after require worlddb'


puts '[boot] before require sportdb'
require 'sportdb'
puts '[boot] after require sportdb'


puts '[boot] before require rails'
require 'rails'
puts '[boot] after require rails'


puts '[boot] before require rails/all'
require 'rails/all'
puts '[boot] after require rails/all'



puts '[boot] before before sportdb-admin'
require 'sportdb/admin'   ## require addon sportdb-keys
puts '[boot] after require sportdb-admin'

