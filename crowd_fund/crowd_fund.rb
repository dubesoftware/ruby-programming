require_relative 'project'
require_relative 'project_manager'

project1 = Project.new("LMN", 500, 3000)
project2 = Project.new("XYZ", 25, 75)
project3 = Project.new("CDE", 75)
projects = [project1, project2, project3]

project_manager = ProjectManager.new("VC-Friendly Start-up Projects")
projects.each do |project|
  project_manager.add_project(project)
end

loop do
  puts "How many funding rounds? ('quit' to exit)"
  answer = gets.chomp.downcase
  
  case answer
  when /^\d+$/
    project_manager.request_funding(Integer(answer))
  when 'quit', 'exit'
    project_manager.print_stats
    break
  else
  end
end