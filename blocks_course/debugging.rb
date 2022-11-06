def with_debugging
  puts "Got Here!"
  result = yield
  puts "Result was #{result}"
end

def with_expectation(expected_value)
  yield == expected_value ? puts "The block passed" : puts "The block failed"
end

with_debugging do
  magic_number = (23 - Time.now.hour) * Math::PI
end