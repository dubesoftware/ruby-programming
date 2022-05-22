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
    "Project #{@name} has $#{@initial_funding_amount} towards a goal of $#{@target_funding_amount}."
  end
  
  def add_funds
    @current_funding_amount += 25
    puts "\nProject #{@name} got more funds!"
  end
  
  def remove_funds
    @current_funding_amount -= 15
    puts "\nProject #{@name} lost some funds!"
  end
  
  def add_to_funds(amount)
    @current_funding_amount += amount
    puts "Project #{@name} got #{amount} funds!"
  end
  
  def remove_from_funds(amount)
    @current_funding_amount -= amount
    puts "Project #{@name} lost #{amount} funds!"
  end
  
  def total_funding_still_needed
    @target_funding_amount - @current_funding_amount
  end
  
  def fully_funded?
    @current_funding_amount >= target_funding_amount
  end
  
  def received_pledge(pledge)
    @received_pledges[pledge.name] = pledge.amount
    puts "#{@name} received a #{pledge.name} worth $#{pledge.amount} dollars."
    puts "#{@name}'s pledges: #{@received_pledges}"
  end
end