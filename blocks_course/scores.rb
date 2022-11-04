require_relative 'utilities'

separator = Utilities::separator
scores = [83, 71, 92, 64, 98, 87, 75, 69]

high_scores = scores.select { |s| s > 80 }
p high_scores
puts separator