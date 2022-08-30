def conversation
  puts "Hello"
  yield
  puts "Goodbye"
end

def five_times
  yield(1)
  yield(2)
  yield(3)
  yield(4)
  yield(5)
end