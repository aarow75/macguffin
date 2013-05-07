$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "entertainment/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "entertainment"
  s.version     = Entertainment::VERSION
  s.authors     = ["Aaron Swensen"]
  s.email       = ["aaron.swensen@gmail.com"]
  s.homepage    = "http://www.icentris.com"
  s.summary     = "Book and Movie tracker"
  s.description = "Book and Movie tracker"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["Rakefile", "README.rdoc"]
  #s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.13"
  s.add_dependency "jquery-rails"
  s.add_dependency "jquery-ui-rails"

  s.add_dependency "pyr_core"
end
