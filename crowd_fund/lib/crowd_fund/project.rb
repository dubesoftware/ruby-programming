require_relative 'die'
require_relative 'pledge_pool'
require_relative 'fundable'

module CrowdFund
  class Project
    include Fundable
  
    attr_accessor :name, :current_funding_amount
    attr_reader :initial_funding_amount, :target_funding_amount
  
    def initialize(name, initial_funding_amount, target_funding_amount = 0)
      @name = name
      @current_funding_amount = @initial_funding_amount = initial_funding_amount
      @target_funding_amount = target_funding_amount
      @received_pledges = Hash.new(0)
    end
  
    def to_s
      "Project #{@name} has $#{total_funding_received} towards a goal of $#{@target_funding_amount}."
    end
  
    def total_funding_still_needed
      @target_funding_amount - total_funding_received
    end
  
    def received_pledge(pledge)
      @received_pledges[pledge.name] += pledge.amount
      puts "#{@name} received a #{pledge.name} pledge worth $#{pledge.amount}."
      puts "#{@name}'s pledges: #{@received_pledges}"
    end
  
    def pledges
      @received_pledges.values.reduce(0, :+)
    end
  
    def total_funding_received
      @current_funding_amount + pledges
    end
  
    def each_received_pledge
      @received_pledges.each do |name, amount|
        yield Pledge.new(name, amount)
      end
    end
  
    def funding_needed_entry
      formatted_name = @name.ljust(20, '.')
      "#{formatted_name} #{total_funding_still_needed}"
    end
  
    def self.from_csv(string)
      name, initial_funding_amount = string.split(',')
      Project.new(name, Integer(initial_funding_amount))
    end
  end
end