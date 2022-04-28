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
  
  it "computes the total funding outstanding as the target funding amount minus the funding amount"
  
  it "increases funds by 25 when funds are added"
  
  it "decreases funds by 15 when funds are removed"
  
  it "has a default value of 0 for funding amount"
end
