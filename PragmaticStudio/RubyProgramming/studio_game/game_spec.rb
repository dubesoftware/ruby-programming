require_relative 'spec_helper'
require_relative 'game'
require_relative 'player'


describe Game do
  before do
    $stdout = StringIO.new
    @game = Game.new("knuckleheads")
    
    @initial_health = 100
    @player = Player.new("moe", @initial_health)
    
    @game.add_player(@player)
  end
  
  it "has capitalized title" do
    @game.title.should == "Knuckleheads"
  end
  
  it "w00ts the player when a high number is rolled" do
    Die.any_instance.stub(:roll).and_return(5)
    
    @game.play(2)
    
    @player.health.should == @initial_health + (15 * 2)
  end
  
  it "skips the player when a medium number is rolled" do
    Die.any_instance.stub(:roll).and_return(3)
    
    @game.play(2)
    
    @player.health.should == @initial_health
  end
  
  it "decreases the player's health when a low number is rolled" do
    Die.any_instance.stub(:roll).and_return(1)
    
    @game.play(2)
    
    @player.health.should == @initial_health - (10 * 2)
  end
end