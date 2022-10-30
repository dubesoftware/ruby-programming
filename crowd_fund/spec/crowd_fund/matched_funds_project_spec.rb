require_relative 'spec_helper'
require_relative 'matched_funds_project'

module CrowdFund
  describe MatchedFundsProject do
  
    before do
      $stdout = StringIO.new
      @name = "Test Matched Funds Project"
      @initial_funding_amount = 250
      @target_funding_amount = 750
      @matching_ratio = 0.5
      @matched_funds_project = MatchedFundsProject.new(@name, @initial_funding_amount, @target_funding_amount, @matching_ratio)
    end
  
    it "does not match funds when less than half of target funds have been received" do
      @matched_funds_project.match_funds
    
      @matched_funds_project.current_funding_amount.should == @initial_funding_amount
    end
  
    it "matches funds when half or more of target funds have been received" do
      @matched_funds_project.add_to_funds(250)
      @matched_funds_project.match_funds
    
      @matched_funds_project.current_funding_amount.should == 875
    end
  end
end