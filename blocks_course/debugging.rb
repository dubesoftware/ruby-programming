def with_debugging
  puts "Got Here!"
  result = yield
  puts "Result was #{result}"
end