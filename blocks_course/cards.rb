cards = %w(Jack Queen King Ace Joker)
cards.shuffle.each { |c| puts "#{c.upcase} - #{c.length}" }