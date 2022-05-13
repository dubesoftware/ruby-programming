require_relative 'funding_round'

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
      FundingRound.fund(project)
      puts project
    end
  end
end