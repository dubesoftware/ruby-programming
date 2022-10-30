require_relative 'spec_helper'
require_relative 'pledge_pool'

module CrowdFund
  describe Pledge do

    before do
      @pledge = Pledge.new(:bronze, 50)
    end

    it "has a name attribute" do
      @pledge.name.should == :bronze
    end

    it "has an amount attribute" do
      @pledge.amount.should == 50
    end

  end

  describe PledgePool do

    it "has three pledges" do
      PledgePool::PLEDGES.size.should == 3
    end

    it "has a bronze pledge worth $50" do
      PledgePool::PLEDGES[0].should == Pledge.new(:bronze, 50)
    end

    it "has a silver pledge worth $75" do
      PledgePool::PLEDGES[1].should == Pledge.new(:silver, 75)
    end

    it "has a gold pledge worth $100" do
      PledgePool::PLEDGES[2].should == Pledge.new(:gold, 100)
    end
  end
end