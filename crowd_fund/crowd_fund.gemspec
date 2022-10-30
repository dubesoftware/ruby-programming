
Gem::Specification.new do |s|
  s.name         = "crowd_fund_dubesoftware"
  s.version      = "1.0.0"
  s.author       = "@dubesoftware"
  s.email        = "zebra05+crowdfund@gmail.com"
  s.homepage     = "https://github.com/dubesoftware/ruby-programming/tree/main/crowd_fund"
  s.summary      = "A console-based game written in Ruby."
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README'))
  s.licenses     = ['MIT']

  s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = [ 'crowd_fund' ]

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec', '~> 2.8', '>= 2.8.0'
end