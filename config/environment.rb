require 'bundler/setup'

Bundler.require

require 'pry'
require 'csv'
require 'sqlite3'

require_relative '../db/parser.rb'
require_relative '../db/schema.rb'

DB = {:conn => SQLite3::Database.new('../db/politician_rap.db')}

Pry.start