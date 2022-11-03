require_relative 'utilities'

separator = Utilities::separator

class Flyer
  attr_reader :name, :email, :miles_flown

  def initialize(name, email, miles_flown)
    @name        = name
    @email       = email
    @miles_flown = miles_flown
  end

  def to_s
    "#{name} (#{email}): #{miles_flown}"
  end
end

flyers = []

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