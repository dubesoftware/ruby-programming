class Agent
    # This will already be implemented and is not part of this exercise
    def initialize; end
    # This will return the amount (integer) by which the agent wants to increase its bid by
    # (i.e. how much they want to add onto their bid as it stands so far)
    # This will already be implemented and is not part of this exercise
    def get_bid_increase; end
end

class Bidding
    def initialize(agents)
        # Set agent name (assuming rand(0..100) gives us enough agent permutations for our case)
        @agent_name = "agent_#{rand(0..100)}"
        # We assume that @agents is an array
        @agents = agents        
        # TODO: any other initialisation you need
        @highest_total_bid = 0        
        # Create a hash to store bids
        @bids = Hash.new
        # An array to shuffle and return a boolean (increase bid or not?)
        @increase_bid_decisions = [:yes, :no]
    end

    def run
        # Assuming that @agents is an array of Agent instances/ objects
        while @agents.size > 1 do
            @agents.each do |agent|
                agent_bid = agent.get_bid_increase
                if agent_bid <= @highest_total_bid
                    if increase_bid?
                        @highest_total_bid += 1
                        @bids[@agent_name] = highest_total_bid
                    else:
                        withdraw(agent)
                    end
                end
            end
        end
    end
    # TODO (optional): add any other methods (with implementation) you find useful

    private
        # Remove agent from ratrace!
        def withdraw(agent)
            @agents.delete_at(@agents.find_index(agent))
        end

        # Shuffle an array and return a boolean - increase bid or not?
        def increase_bid?
            @increase_bid_decisions.shuffle!
            if @increase_bid_decisions.first == :yes
                return true
            return false
        end

end