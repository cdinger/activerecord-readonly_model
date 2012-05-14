require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'active_record'
require 'active_record-readonly_model'

ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => 'test.sqlite3')
