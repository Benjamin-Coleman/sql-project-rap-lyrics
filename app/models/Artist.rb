class Artist
	attr_accessor :name, :id

	def initialize(id=nil, name)
		@id = id
		@name = name
	end


	def self.get_table

		sql2= "CREATE TABLE artists (id INTEGER PRIMARY KEY, name TEXT);"
		DB[:conn].execute(sql2)

		artists = []
		CSV.foreach("./raw/lyrics.csv", {encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
		  artists << row[:artist]
		end
		
		artists.uniq.each do |artist|
			sql = "INSERT INTO artists (name) VALUES (?)"
		 	DB[:conn].execute(sql, artist)	
		end 

		get_table_sql = "SELECT * FROM artists;"
		DB[:conn].execute(get_table_sql)

	end

end
