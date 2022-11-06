require_relative 'utilities'

separator = Utilities::separator

def h1
  print "<h1>"
  print yield
  print "</h1>"
end

def h2
  print "<h2>"
  print yield
  print "</h2>"
end

def tag(name)
  print "<#{name}>"
  print yield
  puts "</#{name}>"
end

puts "Generate h1 tag:"
tag(:h1) { "Breaking News!" }
puts separator

puts "Generate h2 tag:"
tag(:h2) { "Massive Ruby Discovered" }
puts separator

puts "Generate nested HTML elements:"
tag(:ul) do
  tag(:li) { "It sparkles!"}
  tag(:li) { "It shines!"}
  tag(:li) { "It mesmerizes!"}
end
puts separator