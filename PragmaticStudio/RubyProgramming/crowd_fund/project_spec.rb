require_relative 'spec_helper'
require_relative 'project'

describe Project do

  before do
    $stdout = StringIO.new
    @name = "Test Project"
    @initial_funding_amount = 1000
    @target_funding_amount = 5000
    @project = Project.new(@name, @initial_funding_amount, @target_funding_amount)
  end
  
  it "has an initial target funding amount" do
    @project.initial_funding_amount.should == 1000
  end
  
  it "computes the total funding outstanding as the target funding amount minus the funding amount" do
    @project.total_funding_still_needed.should == @target_funding_amount - @initial_funding_amount
  end
  
  it "increases funds by 25 when funds are added" do
    @project.add_funds
    
    @project.current_funding_amount.should == @initial_funding_amount + 25
  end
  
  it "decreases funds by 15 when funds are removed" do
    @project.remove_funds
    
    @project.current_funding_amount.should == @initial_funding_amount - 15
  end
  
  context "created with a default value of 0 for funding amount" do
    before do
      $stdout = StringIO.new
      @name = "Test Project"
      @target_funding_amount = 5000
      @project = Project.new(@name, @target_funding_amount)
    end
    
    it "has a default value of 0 for funding amount" do
      @project.initial_funding_amount.should == 0
    end
  end
end
