5.times do |n|
  %w(situp pushup chinup).each do |w|
    puts "#{n} #{w}"
  end
end

puts "".ljust(20, '-')

1.upto(5) do |n|
  %w(situp pushup chinup).each do |w|
    puts "#{n} #{w}"
  end
end