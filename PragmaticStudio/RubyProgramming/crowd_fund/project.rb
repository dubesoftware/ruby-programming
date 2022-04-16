class Project
  attr_accessor :name
  attr_reader :initial_funding_amount, :target_funding_amount
  
  def initialize(name, initial_funding_amount=1000, target_funding_amount)
    @name = name
    @initial_funding_amount = initial_funding_amount
    @target_funding_amount = target_funding_amount
  end
  
  def to_s
    "Project #{@name} has $#{@initial_funding_amount} towards a goal of $#{@target_funding_amount}."
  end
  
  def add_funds
    @initial_funding_amount += 25
    puts "Project #{@name} got some funds!"
  end
  
  def remove_funds
    @initial_funding_amount -= 15
    puts "Project #{@name} lost some funds!"
  end
  
  def add_to_funds(amount)
    @initial_funding_amount += amount
    puts "Project #{@name} got #{amount} funds!"
  end
  
  def remove_from_funds(amount)
    @initial_funding_amount -= amount
    puts "Project #{@name} lost #{amount} funds!"
  end
  
  def total_funding_still_needed
    @target_funding_amount - @initial_funding_amount
  end
end