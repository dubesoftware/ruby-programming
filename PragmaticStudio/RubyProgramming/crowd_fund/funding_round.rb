require_relative 'die'

module FundingRound
  def self.fund(project)
    die = Die.new
    
    case die.roll % 2
    when 0
      project.add_funds
    when 1
      project.remove_funds
    end
  end
end