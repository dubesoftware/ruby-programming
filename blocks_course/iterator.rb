def three_times
  3.times { yield }
end

three_times { puts "Ho!" }