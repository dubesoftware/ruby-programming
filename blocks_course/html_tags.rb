require_relative 'utilities'

separator = Utilities::separator

def h1
  content = yield
  "<h1>#{content}</h1>"
end

puts "Generate h1 tag:"
puts h1 { "Breaking news!" }
puts separator