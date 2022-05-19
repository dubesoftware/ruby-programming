require_relative 'game_turn'

class Game
  attr_reader :title
  
  def initialize(title)
    @title = title.capitalize
    @players = []
  end
  
  def add_player(player)
    @players << player
  end
  
  def play(rounds)
    puts "There are #{@players.size} players in #{title}:"
    
    1.upto(rounds) do |round|
      puts "\nRound: #{round}"
      @players.each do |player|
        GameTurn.take_turn(player)
        puts player
      end
    end
  end
  
  def print_stats
    strong_players, wimpy_players = @players.partition { |p| p.strong?  }
  end
end