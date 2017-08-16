require 'sqlite3'

database = SQLite3::Database.new("db/robot_cache.db")
database.execute("CREATE TABLE robots(id INTEGER PRIMARY KEY AUTOINCREMENT,
                                      name VARCHAR(20),
                                      city VARCHAR(20),
                                      state VARCHAR(20),
                                      department VARCHAR(40));")
puts "created new robot database"
