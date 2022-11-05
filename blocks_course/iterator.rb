def three_times
  1.upto(3) do |n|
    yield(n)
  end
end

three_times do |n|
  puts "#{n} situp"
  puts "#{n} pushup"
  puts "#{n} chinup"
end