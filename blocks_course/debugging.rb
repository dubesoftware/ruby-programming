require_relative 'utilities'

separator = Utilities::separator

def with_debugging
  puts "Got Here!"
  result = yield
  puts "Result was #{result}"
end

def with_expectation(expected_value)
  puts "Running test..."
  if yield == expected_value
    puts "The block passed"
  else
    puts "The block failed"
  end
end

with_debugging do
  magic_number = (23 - Time.now.hour) * Math::PI
end
puts separator

with_expectation(4) { 2 + 2 }
puts separator