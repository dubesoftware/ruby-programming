require 'timeout'
require_relative 'utilities'

def try_with_timeout(duration)  
  begin
    yield
  rescue
    puts "Took too long!"
  end
end

separator = Utilities::separator

puts "Example timeout with with duration 2.0 and sleep 1.0:"
puts separator
Timeout.timeout(2.0) do
  sleep 1.0
  puts "That was refreshing..."
end
puts separator

puts "Example timeout with with duration 2.0 and sleep 0.3:"
puts separator
Timeout.timeout(2.0) do
  sleep 0.3
  puts "That was almost refreshing..."
end
puts separator

puts "Call timeout with sleep shorter than timeout duration:"
puts separator
try_with_timeout(2.0) do
  sleep 1.0
  puts "That was refreshing..."
end
puts separator