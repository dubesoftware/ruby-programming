require_relative 'utilities'

separator = Utilities::separator

class Flyer
  attr_reader :name, :email, :miles_flown
  attr_accessor :status

  def initialize(name, email, miles_flown, status = :bronze)
    @name        = name
    @email       = email
    @miles_flown = miles_flown
    @status      = status
  end

  def to_s
    "#{name} (#{email}): #{miles_flown} - #{status}"
  end
end

flyers = []
flyers << Flyer.new("Larry", "larry@example.com", 4000, :platinum)
flyers << Flyer.new("Moe", "moe@example.com", 1000)
flyers << Flyer.new("Curly", "curly@example.com", 3000, :gold)
flyers << Flyer.new("Shemp", "shemp@example.com", 2000)

1.upto(5) do |n|
  name        = "Flyer #{n}"
  email       = "flyer#{n}@example.com"
  miles_flown = n * 1000
  
  flyers << Flyer.new(name, email, miles_flown)
end

puts flyers
puts separator

flyers.each { |f| puts "#{f.name} - #{f.miles_flown} miles" }
puts separator

total = 0
flyers.each do |f|
  total += f.miles_flown
end
puts "Total miles flown: #{total}"
puts separator

promotions = { "United" => 1.5, "Delta" => 2.0, "Lufthansa" => 2.5 }
promotions.each { |k, v| puts "Earn #{v}x miles by flying #{k}!" }
puts separator

desserts = { "chocolate" => 1.00, "vanilla" => 0.75, "cinnamon" => 1.25 }
desserts.each { |k, v| puts "$#{v * 2} for a cup of #{k}." }
puts separator

flyers.each do |f|
  promotions.each do |k, v|
    puts "#{f.name} could earn #{f.miles_flown * v} miles by flying #{k}!"
  end
end
puts separator