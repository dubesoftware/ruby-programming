name1 = "larry"
health1 = 60
puts "#{name1.capitalize} has a health of #{health1}."

name2 = "curly"
health2 = 125
puts "#{name2.upcase} has a health of #{health2}."
health2 = health1
puts "#{name2.upcase} now has a health of #{health2}."

health1 = 30
puts "#{name1.capitalize} has a new health of #{health1}."
puts "#{name2.upcase} still has a health of #{health2}."

name3 = "moe"
health3 = 100
puts "#{name3.capitalize} has a health of #{health3}.".center(48, "*")

name4 = "Shemp"
health = 90
puts "#{name4.ljust(32, '.')} #{health} health."

timestamp = Time.new
formatted_time = timestamp.strftime("%A %d/%m/%Y at %I:%M%p")
puts "The game started on #{formatted_time}."