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
p distances_flown_in_km
puts separator