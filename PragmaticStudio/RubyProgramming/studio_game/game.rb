require_relative 'die'

class Game
  attr_reader :title
  
  def initialize(title)
    @title = title.capitalize
    @players = []
  end
  
  def add_player(player)
    @players << player
  end
  
  def play
    puts "There are #{@players.size} players in #{title}:"
    puts @players
    
    die = Die.new
    
    @players.each do |player|
      case die.roll
      when 1..2
        player.blam
      when 3..4
        puts "Player #{player.name} was skipped."
      else
        player.w00t
      end
      puts player
    end
  end
end