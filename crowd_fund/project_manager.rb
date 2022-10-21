require 'csv'
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
  
  def load_projects(from_file)
    CSV.foreach(from_file) do |row|
      project = Project.new(row[0], row[1].to_i)
      add_project(project)
    end
  end
  
  def print_pledge_amounts
    pledges = PledgePool::PLEDGES
    
    puts "\nThere are #{pledges.size} possible pledge amounts:"
    pledges.each do |pledge|
      puts "\tA #{pledge.name} pledge is worth $#{pledge.amount}."
    end
  end
  
  def request_funding(rounds)
    puts "There are #{@projects.size} projects in #{title}:"
    puts @projects
    
    print_pledge_amounts    
    puts "\n"

    1.upto(rounds) do
      @projects.each do |project|
        FundingRound.fund(project)
        puts project
      end
    end
  end
  
  def print_name_and_total_funding_received(project)
    puts "#{project.name} (#{project.total_funding_received})"
  end
  
  def print_stats 
    puts "\n#{@title} Statistics:"
    
    fully_funded_projects, under_funded_projects = @projects.partition { |p| p.fully_funded?  }
    
    puts "\n#{fully_funded_projects.size} fully-funded projects:"
    fully_funded_projects.each do |p|
      print_name_and_total_funding_received(p)
    end
    
    puts "\n#{under_funded_projects.size} under-funded projects:"
    under_funded_projects.each do |p|
      print_name_and_total_funding_received(p)
    end
    
    @projects.each do |project|
      puts "\nProject #{project.name}'s pledges:"
      project.each_received_pledge do |pledge|
        puts "$#{pledge.amount} in #{pledge.name} pledges"
      end
    end
    
    puts "\n#{@title} Needing Contributions:"
    under_funded_projects.sort { |p| p.total_funding_still_needed }.each do |p|
      formatted_name = p.name.ljust(20, '.')
      puts "#{formatted_name} #{p.total_funding_still_needed}"
    end
  end
  
  def save_needed_funding(to_file="needed_funding.txt")
    File.open(to_file, "w") do |file|
      file.puts "#{@title} Needing Funding:"
      @projects.select { |project| project.total_funding_still_needed > 0 }.sort.each do |project|
        file.puts(project.funding_needed_entry)
      end
    end
  end
end