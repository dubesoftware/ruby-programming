def deal
  faces = ["Jack", "Queen", "King", "Ace"]
  suits = ["Hearts", "Diamonds", "Spades", "Clubs"]
  random_face = faces.sample
  random_suit = suits.sample
  yield random_face, random_suit
end

deal { |face, suit| puts "Dealt a #{face} of #{suit}"}