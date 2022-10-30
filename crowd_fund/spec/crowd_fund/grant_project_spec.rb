require 'crowd_fund/spec_helper'
require 'crowd_fund/grant_project'

module CrowdFund
  describe GrantProject do
  
    before do
      $stdout = StringIO.new
      @name = "Test Grant Project"
      @initial_funding_amount = 2000
      @target_funding_amount = 10000
      @grant_project = GrantProject.new(@name, @initial_funding_amount, @target_funding_amount)
    end
  
    it "does not allow funds to be removed" do
      @grant_project.remove_funds
    
      @grant_project.current_funding_amount.should == @initial_funding_amount
    end
  
    it "does not allow deduction from funds" do
      @grant_project.remove_from_funds(500)
    
      @grant_project.current_funding_amount.should == @initial_funding_amount
    end
  end
end