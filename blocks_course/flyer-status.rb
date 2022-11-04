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