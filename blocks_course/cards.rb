require_relative 'utilities'

separator = Utilities::separator

cards = %w(Jack Queen King Ace Joker)
scores = {"Larry" => 10, "Moe" => 8, "Curly" => 12}

cards.shuffle.  each { |c| puts "#{c.upcase} - #{c.length}" }
puts separator
cards.reverse_each { |card| puts "#{card.upcase} - #{card.length}" }
puts separator
scores.each { |k, v| puts "#{k} scored a #{v}!" }
puts separator