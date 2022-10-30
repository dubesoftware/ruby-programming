require_relative '../lib/studio_game/player'
require_relative '../lib/studio_game/clumsy_player'
require_relative '../lib/studio_game/berserk_player'
require_relative '../lib/studio_game/game'

knuckleheads = StudioGame::Game.new("Knuckleheads")
knuckleheads.load_players(ARGV.shift || "players.csv")

clumsy_player = StudioGame::ClumsyPlayer.new("klutz", 105)
knuckleheads.add_player(clumsy_player)

berserker = StudioGame::BerserkPlayer.new("berserker", 50)
knuckleheads.add_player(berserker)

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