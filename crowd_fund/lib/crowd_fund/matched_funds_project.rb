require_relative 'project'

module CrowdFund
  class MatchedFundsProject < Project
  
    def initialize(name, initial_funding_amount, target_funding_amount = 0, matching_ratio = 0.5)
      super(name, initial_funding_amount, target_funding_amount)
      @matching_ratio = matching_ratio
    end
  
    def match_funds
      if @current_funding_amount >= (target_funding_amount * 0.5)
        add_to_funds(target_funding_amount * 0.5)
      end
    end
  end
end