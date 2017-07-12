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

	def self.drop_all_tables
		sql0 = "DROP TABLE IF EXISTS politician_rap_table;"
		sql1 = "DROP TABLE IF EXISTS candidates;"
		sql2 = "DROP TABLE IF EXISTS albums;"
		sql3 = "DROP TABLE IF EXISTS artists;"
		sql4 = "DROP TABLE IF EXISTS songs;"
		DB[:conn].execute(sql0)
		DB[:conn].execute(sql1)
		DB[:conn].execute(sql2)
		DB[:conn].execute(sql3)
		DB[:conn].execute(sql4)
	end



end