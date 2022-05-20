require_relative 'funding_round'
require_relative 'pledge_pool'

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
  
  def print_name_and_current_funding_amount(project)
    puts "#{project.name} (#{project.current_funding_amount})"
  end
  
  def print_stats 
    puts "\n#{@title} Statistics:"
    
    fully_funded_projects, under_funded_projects = @projects.partition { |p| p.fully_funded?  }
    
    puts "\n#{fully_funded_projects.size} fully-funded projects:"
    fully_funded_projects.each do |p|
      print_name_and_current_funding_amount(p)
    end
    
    puts "\n#{under_funded_projects.size} under-funded projects:"
    under_funded_projects.each do |p|
      print_name_and_current_funding_amount(p)
    end
    
    puts "\n#{@title} Projects Needing Contributions:"
    under_funded_projects.sort { |p| p.total_funding_still_needed }.each do |p|
      formatted_name = p.name.ljust(20, '.')
      puts "#{formatted_name} #{p.total_funding_still_needed}"
    end
  end
end