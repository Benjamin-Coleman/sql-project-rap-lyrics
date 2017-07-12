class Parser
	
	def self.parse_to_hash
		parsed = []
		CSV.foreach("./raw/lyrics.csv", {:headers => true, :header_converters => :symbol}) do |row|
			parsed << row.to_h
		end
		parsed
	end

	def self.get_headers
		self.parse_to_hash[0].keys
	end

# ["id", "candidate", "song", "artist", "sentiment", "theme", "album_release_date", "line", "url"]

	_id = 0 
	candidate = 1
	song = 2
	artist = 3
	sentiment = 4
	theme = 5
	release_date = 6
	lyric = 7
	url = 8

	def self.insert_into_db
		CSV.foreach("./raw/lyrics.csv") do |row|
		  sql = "INSERT INTO albums (release_date) VALUES (?)"
		  DB.execute(sql, row[release_date])

		  sql = "INSERT INTO artists (name) VALUES (?)"
		  DB.execute(sql, row[artist])

		  sql = "INSERT INTO candidates (name) VALUES (?)"
		  DB.execute(sql, row[candidate])

		  sql = "INSERT INTO songs (name, sentiment, theme, lyric, url) VALUES (?, ?, ?, ?, ?)"
		  DB.execute(sql, row[name], row[sentiment], row[theme], row[lyric], row[url])

		end
	end

end