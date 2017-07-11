class Album
	attr_accessor :name, :id, :release_date

	def initialize(id=nil, name, release_date=nil)
		@id = id
		@name = name
		@release_date = release_date
	end



end
