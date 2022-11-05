def deal(number_of_cards)
  faces = ["Jack", "Queen", "King", "Ace"]
  suits = ["Hearts", "Diamonds", "Spades", "Clubs"]
  if block_given?
    number_of_cards.times do
      random_face = faces.sample
      random_suit = suits.sample
      score = yield random_face, random_suit
      puts "You scored a #{score}"
    end
  else
    puts "No deal!"
  end
end

deal(10) do |face, suit|
  puts "Dealt a #{face} of #{suit}"
  face.length + suit.length
end

deal(0)

def progress
  0.step(100, 10) do |n|
    yield(n)
  end
end