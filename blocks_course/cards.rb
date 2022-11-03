require_relative 'utilities'

cards = %w(Jack Queen King Ace Joker)
scores = {"Larry" => 10, "Moe" => 8, "Curly" => 12}

cards.shuffle.  each { |c| puts "#{c.upcase} - #{c.length}" }
separator
cards.reverse_each { |card| puts "#{card.upcase} - #{card.length}" }
separator
scores.each { |k, v| puts "#{k} scored a #{v}!" }
separator