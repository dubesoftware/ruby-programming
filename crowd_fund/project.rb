require_relative 'die'
require_relative 'pledge_pool'

class Project
  attr_accessor :name
  attr_reader :initial_funding_amount, :current_funding_amount, :target_funding_amount
  
  def initialize(name, initial_funding_amount, target_funding_amount=0)
    @name = name
    @current_funding_amount = @initial_funding_amount = initial_funding_amount
    @target_funding_amount = target_funding_amount
    @received_pledges = Hash.new(0)
  end
  
  def to_s
    "Project #{@name} has $#{total_funding_received} towards a goal of $#{@target_funding_amount}."
  end
  
  def add_funds
    @current_funding_amount += 25
    puts "\nProject #{@name} got $25 more!"
  end
  
  def remove_funds
    @current_funding_amount -= 15
    puts "\nProject #{@name} lost $15!"
  end
  
  def add_to_funds(amount)
    @current_funding_amount += amount
    puts "\nProject #{@name} got #{amount} funds!"
  end
  
  def remove_from_funds(amount)
    @current_funding_amount -= amount
    puts "\nProject #{@name} lost #{amount} funds!"
  end
  
  def total_funding_still_needed
    @target_funding_amount - total_funding_received
  end
  
  def fully_funded?
    total_funding_received >= @target_funding_amount
  end
  
  def received_pledge(pledge)
    @received_pledges[pledge.name] += pledge.amount
    puts "#{@name} received a #{pledge.name} pledge worth $#{pledge.amount}."
    puts "#{@name}'s pledges: #{@received_pledges}"
  end
  
  def pledges
    @received_pledges.values.reduce(0, :+)
  end
  
  def total_funding_received
    @current_funding_amount + pledges
  end
  
  def each_received_pledge
    @received_pledges.each do |name, amount|
      yield Pledge.new(name, amount)
    end
  end
  
  def funding_needed_entry
    formatted_name = @name.ljust(20, '.')
    "#{formatted_name} #{total_funding_still_needed}"
  end
  
  def self.from_csv(string)
    name, initial_funding_amount = string.split(',')
    Project.new(name, Integer(initial_funding_amount))
  end
end