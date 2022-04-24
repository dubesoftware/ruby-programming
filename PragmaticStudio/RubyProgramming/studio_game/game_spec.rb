require 'rspec'
require_relative 'game'

RSpec.describe Game do
  
  it "has capitalized title" do
    game = Game.new("goonies")
    
    game.title.should == "Goonies"
  end
end