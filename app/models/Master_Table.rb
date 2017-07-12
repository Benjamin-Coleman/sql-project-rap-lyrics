class Master_Table
	# attr_accessor :name, :id

	# def initialize(id=nil, name)
	# 	@id = id
	# 	@name = name
	# end


	def self.create
		sql2= "CREATE TABLE politician_rap_table (id INTEGER PRIMARY KEY, candidate TEXT, song TEXT, artist TEXT, sentiment TEXT, theme TEXT, album_release_date INTEGER, line TEXT, url TEXT);"
		DB[:conn].execute(sql2)

		CSV.foreach("./raw/lyrics.csv", {encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
		  sql = "INSERT INTO politician_rap_table (candidate, song, artist, sentiment, theme, album_release_date, line, url) VALUES (?, ?, ?, ?, ?, ?, ?, ? )"
		  DB[:conn].execute(sql, row[:candidate], row[:song], row[:artist], row[:sentiment], row[:theme], row[:album_release_date], row[:line], row[:url])
		end

		get_table_sql = "SELECT * FROM politician_rap_table;"
		DB[:conn].execute(get_table_sql)
	end


	def self.most_mentioned_candidate
		sql = <<-SQL
			SELECT candidate FROM politician_rap_table 
			GROUP BY candidate ORDER BY COUNT(candidate) 
			DESC  LIMIT 1;
		SQL
		DB[:conn].execute(sql)[0][0]
	end	

	def self.highest_positive_sentiment
		sql = <<-SQL
		SELECT candidate FROM politician_rap_table
		WHERE sentiment = 'positive'
		GROUP BY candidate
		ORDER BY COUNT(candidate)
		DESC LIMIT 1
		SQL
		DB[:conn].execute(sql)[0][0]
	end

	def self.highest_negative_sentiment
		sql = <<-SQL
		SELECT candidate FROM politician_rap_table
		WHERE sentiment = 'negative'
		GROUP BY candidate
		ORDER BY COUNT(candidate)
		DESC LIMIT 1
		SQL
		DB[:conn].execute(sql)[0][0]
	end

	def self.artist_with_most_mentions
		sql = <<-SQL
		SELECT artist FROM politician_rap_table
		GROUP BY artist
		ORDER BY COUNT(*)
		DESC LIMIT 1
		SQL
		DB[:conn].execute(sql)[0][0]
	end

	def self.year_with_most_mentions
		sql = <<-SQL
		SELECT album_release_date FROM politician_rap_table
		GROUP BY album_release_date
		ORDER BY COUNT(*)
		DESC LIMIT 1
		SQL
		DB[:conn].execute(sql)[0][0]
	end



end
