require 'benchmark'
require_relative 'utilities'

separator = Utilities::separator

def with_debugging
  puts "Got Here!"
  result = yield
  puts "Result was #{result}"
end

def with_expectation(expected_value)
  puts "Running test..."
  result = yield
  if result == expected_value
    puts "Passed."
  else
    puts "Failed!"
    puts "Expected #{expected_value}, but got #{result}."
  end
end

def time_it(description)
  elapsed_time = Benchmark::realtime do
    yield
  end
  puts "#{description} took #{elapsed_time}"
end

with_debugging do
  magic_number = (23 - Time.now.hour) * Math::PI
end
puts separator

with_expectation(4) { 2 + 2 }
puts separator

time_it("Sleepy code") { sleep(1) }