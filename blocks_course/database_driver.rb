require_relative 'utilities'

class DatabaseDriver
  def initialize(database, user, password)
    @database = database
    @user = user
    @password = password
    @connected = false
  end

  def connect
    # connects to database
    @connected = true
    puts "Connected to #{@database} as #{@user}."
  end

  def disconnect
    # disconnects from database
    puts "Disconnected."
  end

  def execute(sql)
    raise "Not connected!" unless @connected
    puts "Executing #{sql}..."
    # executes SQL
  end
  
  def self.open(database, user, password)
    driver = self.new(database, user, password)
    driver.connect
    begin
      yield driver
    ensure
      driver.disconnect
    end
  end
end

separator = Utilities::separator

puts "To run a couple SQL queries, call the methods in the proper order:"
puts separator
driver = DatabaseDriver.new("my_database", "admin", "secret")

driver.connect
driver.execute("SELECT * FROM ORDERS")
driver.execute("SELECT * FROM USERS")
driver.disconnect
puts separator

puts "Test open class method:"
puts separator
DatabaseDriver.open("my_database", "admin", "secret") do |driver|
  driver.execute("SELECT * FROM ORDERS")
  driver.execute("SELECT * FROM USERS")
end