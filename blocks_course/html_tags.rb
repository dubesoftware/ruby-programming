require_relative 'utilities'

separator = Utilities::separator

def generate_tag(tag)
  content = yield
  "<#{tag}>#{content}</#{tag}>"
end

def h1
  content = yield
  "<h1>#{content}</h1>"
end

def h2
  content = yield
  "<h2>#{content}</h2>"
end

puts "Generate h1 tag:"
puts h1 { "Breaking News!" }
puts separator

puts "Generate h2 tag:"
puts h1 { "Massive Ruby Discovered" }
puts separator