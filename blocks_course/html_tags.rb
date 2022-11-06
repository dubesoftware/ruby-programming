require_relative 'utilities'

separator = Utilities::separator

def h1
  content = yield
  "<h1>#{content}</h1>"
end

def h2
  content = yield
  "<h2>#{content}</h2>"
end

def tag(name)
  content = yield
  "<#{name}>#{content}</#{name}>"
end

puts "Generate h1 tag:"
puts tag(:h1) { "Breaking News!" }
puts separator

puts "Generate h2 tag:"
puts tag(:h2) { "Massive Ruby Discovered" }
puts separator