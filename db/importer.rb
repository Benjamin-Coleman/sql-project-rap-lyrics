require 'pry'
require 'csv'
require 'sqlite3'

db = SQLite3::Database.new("fivethirtyeight.db")

db.execute("DROP TABLE IF EXISTS politician_rap_table;")

sql = <<-SQL
  create table IF NOT EXISTS politician_rap_table (
    id INTEGER PRIMARY KEY,
    candidate TEXT,
    song TEXT,
    artist TEXT,
    sentiment TEXT,
    theme TEXT,
    album_release_date INTEGER,
    lyric TEXT,
    url TEXT
  );
SQL

db.execute(sql)

csv = '../lyrics.csv'

statement = 
"INSERT INTO politician_rap_table (candidate, song, artist, sentiment, theme, album_release_date, lyric, url) VALUES "

# CSV.parse(csv, headers: true, ) do |row|


CSV.foreach('./lyrics.csv', {encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
	statement << "('#{row[:candidate]}', '#{row[:song]}', '#{row[:artist]}', '#{row[:sentiment]}', '#{row[:theme]}', #{row[:album_release_date]}, '#{row[:line]}', '#{row[:url]}'), "

end 


statement_2 = statement.chomp(", ")


statement_2 << ";"



db.execute(statement_2)