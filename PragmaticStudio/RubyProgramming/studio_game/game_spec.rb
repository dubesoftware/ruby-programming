require 'rspec'
require_relative 'game'

RSpec.describe Game do
  
  it "has capitalized title" do
    game = Game.new("goonies")
    
    game.title.should == "Goonies"
  end
  
  it 'does something'
  
  it 'does something else'
end