require_relative 'die'

class Project
  attr_accessor :name
  attr_reader :initial_funding_amount, :current_funding_amount, :target_funding_amount
  
  def initialize(name, initial_funding_amount=0, target_funding_amount)
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
    @target_funding_amount - @current_funding_amount
  end
  
  def fully_funded?
    @current_funding_amount >= target_funding_amount
  end
  
  def received_pledge(pledge)
    @received_pledges[pledge.name] = pledge.amount
    puts "#{@name} received a #{pledge.name} pledge worth $#{pledge.amount}."
    puts "#{@name}'s pledges: #{@received_pledges}"
  end
  
  def pledges
    @received_pledges.values.reduce(0, :+)
  end
  
  def total_funding_received
    @current_funding_amount + pledges
  end
end