
Gem::Specification.new do |s|
  s.name         = "studio_game_dubesoftware"
  s.version      = "1.0.0"
  s.author       = "@dubesoftware"
  s.email        = "zebra05+studiogame@gmail.com"
  s.homepage     = "https://github.com/dubesoftware/ruby-programming/tree/main/studio_game"
  s.summary      = "A console-based game written in Ruby."
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README'))
  s.licenses     = ['MIT']

  s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = [ 'studio_game' ]

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec', '~> 2.8', '>= 2.8.0'
end