require 'sqlite3'

class Robot
  attr_reader :id,
              :name,
              :city,
              :state,
              :department
  def initialize(robot_params)
    @id = robot_params[:id]
    @name = robot_params[:name]
    @city = robot_params[:city]
    @state = robot_params[:state]
    @department = robot_params[:department]
    @database = SQLite3::Database.new('db/robot_cache.db')
    @database.results_as_hash = true
  end

  def self.all
    robots = @database.execute("SELECT * FROM robots;")
    robots.map do |robot|
      Robot.new(robot)
    end
  end

  def self.find_by_id(id)
    robot = @database.execute("SELECT * FROM robots WHERE id=?;", id)
    Robot.new(robot)
  end

  def save
    @database.execute("INSERT INTO robots(name, city, state, department)
                                          VALUES (?, ?, ?, ?);", name, city, state, department)
  end

  def self.delete(id)
    @database.execute("DELETE * FROM robots WHERE id=?;", id)
  end
end
