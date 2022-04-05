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

class ProjectManager
  attr_reader :title
  
  def initialize(title)
    @title = title
    @projects = []
  end
  
  def add_project(project)
    @projects << project
  end
  
  def request_funding
    puts "There are #{@projects.size} projects in #{title}:"
    puts @projects
    @projects.each do |project|
      project.add_to_funds(1000)
      project.remove_funds
      puts project
    end
  end
end

project1 = Project.new("LMN", 500, 3000)
project2 = Project.new("XYZ", 25, 75)
project3 = Project.new("CDE", 75)
projects = [project1, project2, project3]

project_manager = ProjectManager.new("VC-Friendly Start-up Projects")
projects.each do |project|
  project_manager.add_project(project)
end
project_manager.request_funding