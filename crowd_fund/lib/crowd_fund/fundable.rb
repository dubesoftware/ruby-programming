module CrowdFund
  module Fundable
  
    def add_funds
      self.current_funding_amount += 25
      puts "\nProject #{name} got $25 more!"
    end
  
    def remove_funds
      self.current_funding_amount -= 15
      puts "\nProject #{name} lost $15!"
    end
  
    def add_to_funds(amount)
      self.current_funding_amount += amount
      puts "\nProject #{name} got #{amount} funds!"
    end
  
    def remove_from_funds(amount)
      self.current_funding_amount -= amount
      puts "\nProject #{name} lost #{amount} funds!"
    end
  
    def fully_funded?
      total_funding_received >= target_funding_amount
    end
  end
end