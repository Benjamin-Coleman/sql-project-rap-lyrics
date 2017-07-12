class Schema
  def self.create_tables

    sql = <<-SQL
    CREATE TABLE IF NOT EXISTS artists(
      id INTEGER PRIMARY KEY,
      name TEXT
    )
    SQL
    DB[:conn].execute(sql)

    sql = <<-SQL
    CREATE TABLE IF NOT EXISTS candidates(
      id INTEGER PRIMARY KEY,
      name TEXT
    )
    SQL
    DB[:conn].execute(sql)

    sql = <<-SQL
    CREATE TABLE IF NOT EXISTS songs(
      id INTEGER PRIMARY KEY,
      name TEXT,
      sentiment TEXT,
      theme TEXT,
      lyric TEXT,
      url TEXT,
      artist_id INTEGER,
      album_id INTEGER
    )
    SQL
    DB[:conn].execute(sql)

    sql = <<-SQL
    CREATE TABLE IF NOT EXISTS albums(
      id INTEGER PRIMARY KEY,
      release_date INTEGER
    )
    SQL
    DB[:conn].execute(sql)

  end
end
