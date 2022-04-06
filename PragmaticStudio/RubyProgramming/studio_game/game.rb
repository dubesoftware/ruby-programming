# require_relative 'player'

class Game
  attr_reader :title
  
  def initialize(title)
    @title = title
    @players = []
  end
  
  def add_player(player)
    @players << player
  end
  
  def play
    puts "There are #{@players.size} players in #{title}:"
    puts @players
    @players.each do |player|
      player.blam
      2.times do
        player.w00t
      end
      puts player
    end
  end
end