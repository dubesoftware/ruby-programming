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
  
  it "computes the total funding outstanding as the target funding amount minus the total funding received" do
    @project.total_funding_still_needed.should == @project.target_funding_amount - @project.total_funding_received
  end
  
  it "increases funds by 25 when funds are added" do
    Die.any_instance.stub(:roll).and_return(2)
    
    @project.add_funds
    
    @project.current_funding_amount.should == @initial_funding_amount + 25
  end
  
  it "decreases funds by 15 when funds are removed" do
    Die.any_instance.stub(:roll).and_return(1)
    
    @project.remove_funds
    
    @project.current_funding_amount.should == @initial_funding_amount - 15
  end
  
  it "adds funds to a project when an even number is rolled" do
    Die.any_instance.stub(:roll).and_return(2)
    
    @project.add_funds
    
    @project.current_funding_amount.should == @initial_funding_amount + 25
  end
  
  it "removes funds from a project when an odd number is rolled" do
    Die.any_instance.stub(:roll).and_return(1)
    
    @project.remove_funds
    
    @project.current_funding_amount.should == @initial_funding_amount - 15
  end
  
  it "is fully funded when the total funding amount equals or exceeds the target funding amount" do
    Die.any_instance.stub(:roll).and_return(2)
    
    @project.add_to_funds(4000)
    
    @project.should be_fully_funded
  end
  
  context "created with a default value of 0 for funding amount" do
    before do
      @project = Project.new(@name, @target_funding_amount)
    end
    
    it "has a default value of 0 for funding amount" do
      @project.initial_funding_amount.should == 0
    end
  end
end
