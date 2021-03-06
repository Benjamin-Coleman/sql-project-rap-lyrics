def most_mentioned
	sql = <<-SQL
		SELECT candidate FROM politician_rap_table 
		GROUP BY candidate ORDER BY COUNT(candidate) 
		DESC  LIMIT 1;
	SQL
	DB[:conn].execute(sql)
end	

def highest_positive_sentiment
	sql = <<-SQL
	SELECT candidate FROM politician_rap_table
	GROUP BY candidate
	WHERE sentiment = "positive"
	ORDER BY COUNT(candidate)
	DESC LIMIT 1
	SQL
	DB[:conn].execute(sql)
end

def highest_negative_sentiment
	sql = <<-SQL
	SELECT candidate FROM politician_rap_table
	GROUP BY candidate
	WHERE sentiment = "negative"
	ORDER BY COUNT(candidate)
	DESC LIMIT 1
	SQL
	DB[:conn].execute(sql)
end

def artist_with_most_mentions
	sql = <<-SQL
	SELECT artist FROM politician_rap_table
	GROUP BY artist
	ORDER BY COUNT(*)
	DESC LIMIT 1
	SQL
	DB[:conn].execute(sql)
end

def year_with_most_mentions
	sql = <<-SQL
	SELECT album_release_date FROM politician_rap_table
	GROUP BY album_release_date
	ORDER BY COUNT(*)
	DESC LIMIT 1
	SQL
	DB[:conn].execute(sql)
end