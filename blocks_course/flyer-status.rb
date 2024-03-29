require_relative 'flyer'
require_relative 'utilities'

separator = Utilities::separator

flyers = []
flyers << Flyer.new("Larry", "larry@example.com", 4000, :platinum)
flyers << Flyer.new("Moe", "moe@example.com", 1000)
flyers << Flyer.new("Curly", "curly@example.com", 3000, :gold)
flyers << Flyer.new("Shemp", "shemp@example.com", 2000)

frequent_flyer_customers = flyers.select { |f| f.miles_flown >= 3000 }
puts frequent_flyer_customers
puts separator

less_frequent_flyer_customers = flyers.reject { |f| f.miles_flown >= 3000 }
puts less_frequent_flyer_customers
puts separator

any_platinum_flyers = flyers.any? { |f| f.status == :platinum }
p any_platinum_flyers
puts separator

first_bronze_status_flyer = flyers.detect { |f| f.status == :bronze }
puts first_bronze_status_flyer
puts separator

platinum_flyers, other_flyers = flyers.partition { |f| f.status == :platinum }
puts "Platinum flyers:"
puts platinum_flyers
puts "Other flyers:"
puts other_flyers
puts separator

name_tags = flyers.map { |f| "#{f.name} (#{f.status.upcase})" }
p name_tags
puts separator

distances_flown_in_km = flyers.map { |f| f.miles_flown * 1.6 }
puts "Distances flown in km: #{distances_flown_in_km}"
puts separator

total_miles_flown = flyers.reduce(0) { |total, f| total + f.miles_flown }
puts "Total miles flown: #{total_miles_flown}"
puts separator

total_kilometres_flown = flyers.map { |f| f.miles_flown * 1.6 }.reduce(0, :+)
puts "Total kilometres flown: #{total_kilometres_flown}"
puts separator

total_bronze_km = flyers.select { |f| f.status == :bronze }.map { |f| f.miles_flown * 1.6 }.reduce(0, :+)
puts "Total distance flown by bronze flyers in kilometres: #{total_bronze_km}"
puts separator

top_flyer = flyers.max_by { |f| f.miles_flown }
puts "Flyer with the most miles: #{top_flyer}"
puts separator