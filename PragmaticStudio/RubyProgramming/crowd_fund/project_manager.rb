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
  
  def request_funding(rounds)
    puts "There are #{@projects.size} projects in #{title}:"

    1.upto(rounds) do
      @projects.each do |project|
        FundingRound.fund(project)
        puts project
      end
    end
  end
end