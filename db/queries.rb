def most_mentioned
	sql = <<-SQL
		SELECT candidate FROM politician_rap 
		GROUP BY candidate ORDER BY COUNT(candidate) 
		DESC  LIMIT 1;
	SQL
	db.execute(sql)
end	

def highest_positive_sentiment
	sql = <<-SQL
	SELECT candidate FROM politician_rap
	GROUP BY candidate
	WHERE sentiment = "positive"
	ORDER BY COUNT(candidate)
	DESC LIMIT 1
	SQL
	db.execute(sql)
end

def highest_negative_sentiment
	sql = <<-SQL
	SELECT candidate FROM politician_rap
	GROUP BY candidate
	WHERE sentiment = "negative"
	ORDER BY COUNT(candidate)
	DESC LIMIT 1
	SQL
	db.execute(sql)
end

def artist_with_most_mentions
	sql = <<-SQL
	SELECT artist FROM politician_rap
	GROUP BY artist
	ORDER BY COUNT(*)
	DESC LIMIT 1
	SQL
	db.execute(sql)
end