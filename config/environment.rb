require 'bundler/setup'

Bundler.require

require 'pry'
require 'csv'
require 'sqlite3'

require_relative '../db/helper.rb'
require_relative '../db/queries.rb'
require_relative '../app/models/Master_Table.rb'
require_relative '../app/models/Artist.rb'
require_relative '../app/models/Candidate.rb'
require_relative '../app/models/Song.rb'


DB = {:conn => SQLite3::Database.new('../db/politician_rap.db')}

Pry.start