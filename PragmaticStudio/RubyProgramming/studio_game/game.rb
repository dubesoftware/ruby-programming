require_relative 'game_turn'
require_relative 'treasure_trove'

class Game
  attr_reader :title
  
  def initialize(title)
    @title = title.capitalize
    @players = []
  end
  
  def add_player(player)
    @players << player
  end
  
  def print_name_and_health(player)
    puts "#{player.name} (#{player.health})"
  end
  
  def total_points
    @players.reduce(0) { |sum, p| sum + p.points }
  end
  
  def print_stats    
    puts "\n#{@title} Statistics:"
    
    strong_players, wimpy_players = @players.partition { |p| p.strong?  }
    
    puts "\n#{strong_players.size} strong players:"
    strong_players.each do |p|
      print_name_and_health(p)
    end
    
    puts "\n#{wimpy_players.size} wimpy players:"
    wimpy_players.each do |p|
      print_name_and_health(p)
    end
    
    puts "\n#{total_points} total points from treasures found"
    
    @players.each do |p|
      puts "\n#{p.name}'s point totals:"
      puts "#{p.points} grand total points"
    end
    
    puts "\n#{@title} High Scores:"
    @players.sort.each do |p|
      formatted_name = p.name.ljust(20, '.')
      puts "#{formatted_name} #{p.score}"
    end
  end
  
  def play(rounds)
    puts "There are #{@players.size} players in #{title}:"
    
    treasures = TreasureTrove::TREASURES
    
    puts "\nThere are #{treasures.size} treasures to be found:"
    treasures.each do |treasure|
      puts "A #{treasure.name} is worth #{treasure.points} points"
    end
    
    1.upto(rounds) do |round|
      puts "\nRound: #{round}"
      @players.each do |player|
        GameTurn.take_turn(player)
      end
    end
  end
end