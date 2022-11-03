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