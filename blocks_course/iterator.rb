def three_times
  yield(1)
  yield(2)
  yield(3)
end

three_times do |n|
  puts "#{n} situp"
  puts "#{n} pushup"
  puts "#{n} chinup"
end