require_relative 'utilities'

separator = Utilities::separator
scores = [83, 71, 92, 64, 98, 87, 75, 69]

high_scores = scores.select { |s| s > 80 }
p high_scores
puts separator

low_scores = scores.reject { |s| s > 80 }
p low_scores
puts separator

any_failing_scores = scores.any? { |s| s < 70 }
p any_failing_scores
puts separator

first_failing_score = scores.detect { |s| s < 70 }
p first_failing_score
puts separator

scores.select! { |s| s > 70 }
p scores
puts separator

scores.reject! { |s| s.even? }
p scores
puts separator

scores_doubled = scores.map { |s| s * 2 }
p scores_doubled
puts separator

total_scores = scores.reduce(0, :+)
puts "Total score: #{total_scores}"
puts separator