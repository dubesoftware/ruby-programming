require 'timeout'
require_relative 'utilities'

separator = Utilities::separator

puts "Example timeout with with duration 2.0 and sleep 1.0:"
puts separator
Timeout.timeout(2.0) do
  sleep 1.0
  puts "That was refreshing..."
end
puts separator