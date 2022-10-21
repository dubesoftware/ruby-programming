require_relative 'player'
require_relative 'clumsy_player'
require_relative 'game'

knuckleheads = Game.new("Knuckleheads")
knuckleheads.load_players(ARGV.shift || "players.csv")

clumsy_player = ClumsyPlayer.new("klutz", 105)
knuckleheads.add_player(clumsy_player)

loop do
  puts "\nHow many game rounds? ('quit' to exit)"
  answer = gets.chomp.downcase
  
  case answer
  when /^\d+$/
    knuckleheads.play(answer.to_i) do
      knuckleheads.total_points >= 2000
    end
  when 'quit', 'exit'
    knuckleheads.print_stats
    break
  else
    puts "Please enter a number or 'quit'"
  end
end

knuckleheads.save_high_scores