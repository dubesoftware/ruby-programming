def h1
  content = yield
  "<h1>#{content}</h1>"
end

puts h1 { "Breaking news!" }