require_relative 'spec_helper'
require_relative 'game'


describe Game do
  
  it "has capitalized title" do
    game = Game.new("goonies")
    
    game.title.should == "Goonies"
  end

end