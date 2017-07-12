class Candidate
	attr_accessor :name, :id

	def initialize(id=nil, name)
		@id = id
		@name = name
	end


	def self.get_table

		sql2= "CREATE TABLE candidates (id INTEGER PRIMARY KEY, name TEXT);"
		DB[:conn].execute(sql2)

		candidates = []
		CSV.foreach("./raw/lyrics.csv", {encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
		  candidates << row[:candidate]
		end
		
		candidates.uniq.each do |candidate|
			sql = "INSERT INTO candidates (name) VALUES (?)"
		 	DB[:conn].execute(sql, candidate)	
		end 

		get_table_sql = "SELECT * FROM candidates;"
		DB[:conn].execute(get_table_sql)
	end




end
