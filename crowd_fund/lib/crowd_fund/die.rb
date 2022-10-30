module CrowdFund
  class Die
    attr_accessor :number
  
    def initialize
      @number = roll
    end
  
    def roll
      rand(1..6)
    end
  end
end