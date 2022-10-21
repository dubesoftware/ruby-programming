require_relative 'project'
require_relative 'project_manager'

project_manager = ProjectManager.new("VC-Friendly Start-up Projects")
project_manager.load_projects(ARGV.shift || "projects.csv")

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
    puts "Please enter a number or 'quit'"
  end
end

project_manager.save_needed_funding