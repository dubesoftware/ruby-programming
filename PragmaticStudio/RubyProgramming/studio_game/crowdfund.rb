project1 = "Project ABC"
# funding1 = 1000

project2 = "Project MLN"
funding2 = 1500

project3 = "Project XYZ"
funding3 = 2000

def introduce(project, funding=1000)
  "Project #{project} has #{funding} in funding."
end

puts introduce(project1)
puts introduce(project2, funding2)
puts introduce(project3, funding3)