require_relative 'project'

module CrowdFund
  class GrantProject < Project
  
    def remove_funds
      "Grant projects do not allow removal of funds."
    end
  
    def remove_from_funds(amount)
      "Grant projects do not allow deduction from funds."
    end
  end
end