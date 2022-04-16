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