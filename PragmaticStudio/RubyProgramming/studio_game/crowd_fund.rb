class Project
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
    "Project #{@name} got some funds!"
  end
  
  def remove_funds
    @initial_funding_amount -= 15
    "Project #{@name} lost some funds!"
  end
  
  def add_to_funds(amount)
    @initial_funding_amount += amount
    "Project #{@name} got #{amount} funds!"
  end
  
  def remove_from_funds(amount)
    @initial_funding_amount -= amount
    "Project #{@name} lost #{amount} funds!"
  end
end

project1 = Project.new("LMN", 500, 3000)
project2 = Project.new("XYZ", 25, 75)
project3 = Project.new("CDE", 75)
puts project1
puts project1.remove_funds
puts project2.add_funds
puts project1
puts project2
puts project3