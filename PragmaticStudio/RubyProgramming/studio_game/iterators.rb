def conversation
  puts "Hello"
  yield
  puts "Goodbye"
end

def five_times
  1.upto(5) do |n|
    yield n
  end
end