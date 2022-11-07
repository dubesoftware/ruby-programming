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
    return driver unless block_given?
    begin
      yield driver
    ensure
      driver.disconnect
    end
  end
  
  def begin_transaction
    puts "Beginning transaction..."
  end

  def commit_transaction
    puts "Committed transaction."
  end

  def rollback_transaction
    puts "Rolled back transaction!"
  end
  
  def transactionally
    begin
      begin_transaction
      yield
      commit_transaction
    rescue
      rollback_transaction
    ensure
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
puts separator

puts "Double-check that the driver connection is always closed, even if the block raises an exception:"
puts separator
DatabaseDriver.open("my_database", "admin", "secret") do |driver|
  driver.execute("DELETE * FROM ORDERS")
  # raise "Boom!"
  driver.execute("DELETE * FROM USERS")
end
puts separator

puts "If an (optional) block isn't associated with the open method then simply return a connected DatabaseDriver object:"
puts separator
driver = DatabaseDriver.open("my_database", "admin", "secret")
driver.execute("SELECT * FROM ORDERS")
driver.execute("SELECT * FROM USERS")
driver.disconnect
puts separator

puts "Transaction example:"
puts separator
DatabaseDriver.open("my_database", "admin", "secret") do |driver|
  driver.transactionally do
    driver.execute("UPDATE ORDERS SET status='completed'")
    driver.execute("DELETE * FROM SHIPPING_QUEUE")
  end

  # not run in a transaction
  driver.execute("SELECT * FROM ORDERS")
  driver.execute("SELECT * FROM USERS")
end
puts separator

puts "Handle the case where an exception is raised in the transactionally block:"
puts separator
DatabaseDriver.open("my_database", "admin", "secret") do |driver|
  driver.transactionally do
    driver.execute("UPDATE ORDERS SET status='completed'")
    raise "Boom!"
    driver.execute("DELETE * FROM SHIPPING_QUEUE")
  end
end
puts separator