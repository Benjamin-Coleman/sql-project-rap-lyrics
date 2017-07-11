class Song
	attr_accessor :name, :id, :artist_id, :sentiment, :theme, :album_id, :lyric, :url

	def initialize(id=nil, name, artist_id=nil, sentiment=nil, theme=nil, album_id=nil, lyric=nil, url=nil)
		@id = id
		@name = name
		@artist_id = artist_id
		@sentiment = sentiment
		@theme = theme
		@album_id = album_id
		@lyric = lyric
		@url = url
	end



end
