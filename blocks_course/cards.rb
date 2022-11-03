def separator
  puts "".ljust(20, '-')
end

cards = %w(Jack Queen King Ace Joker)

cards.shuffle.  each { |c| puts "#{c.upcase} - #{c.length}" }
separator
cards.reverse_each { |card| puts "#{card.upcase} - #{card.length}" }
separator