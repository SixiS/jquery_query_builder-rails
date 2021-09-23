$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'pry'
require 'jquery_query_builder-rails'

ActiveRecord::Base.establish_connection(
  database: 'jquery_query_build_rails_test',
  adapter: 'sqlite3',
  dbfile:  ':memory:'
)