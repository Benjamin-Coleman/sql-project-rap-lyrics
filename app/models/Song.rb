class Song
	# attr_accessor :name, :id, :artist_id, :sentiment, :theme, :album_id, :lyric, :url

	# def initialize(id=nil, name, artist_id=nil, sentiment=nil, theme=nil, album_release_date=nil, album_id=nil, lyric=nil, url=nil)
	# 	@id = id
	# 	@name = name
	# 	@artist_id = artist_id
	# 	@sentiment = sentiment
	# 	@theme = theme
	# 	@album_release_date = album_release_date
	# 	@album_id = album_id
	# 	@lyric = lyric
	# 	@url = url
	# end



	def self.get_table
		sql2= "CREATE TABLE songs (id INTEGER PRIMARY KEY, name TEXT, sentiment TEXT, theme TEXT, release_date INTEGER, lyric TEXT, url TEXT);"
		DB[:conn].execute(sql2)

		CSV.foreach("./raw/lyrics.csv", {encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|

		  sql = "INSERT INTO songs (name, sentiment, theme, release_date, lyric, url) VALUES (?, ?, ?, ?, ?, ?)"
		  DB[:conn].execute(sql, row[:song], row[:sentiment], row[:theme], row[:album_release_date], row[:line], row[:url])

		end

		get_table_sql = "SELECT * FROM songs;"
		DB[:conn].execute(get_table_sql)
	end

	def self.join_table
		sql = <<-SQL
			SELECT politician_rap_table.song, politician_rap_table.sentiment, politician_rap_table.theme, politician_rap_table.album_release_date, politician_rap_table.line, politician_rap_table.url, candidates.id, artists.id 
			FROM politician_rap_table
			INNER JOIN candidates
			ON politician_rap_table.candidate = candidates.name
			INNER JOIN artists 
			ON politician_rap_table.artist = artists.name 
			SQL
		DB[:conn].execute(sql)

	end



end
