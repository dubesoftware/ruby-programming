require_relative 'die'
require_relative 'pledge_pool'

module FundingRound
  def self.fund(project)
    die = Die.new
    
    case die.roll % 2
    when 0
      project.add_funds
    when 1
      project.remove_funds
    end
    
    pledge = PledgePool.random
    project.received_pledge(pledge)  
  end
end