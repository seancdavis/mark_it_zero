$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mark_it_zero/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mark_it_zero"
  s.version     = MarkItZero::VERSION
  s.authors     = ["Sean C Davis"]
  s.email       = ["scdavis41@gmail.com"]
  s.homepage    = ""
  s.summary     = "Syntax highlighted markdown editor for rails"
  s.description = ""
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.0"

  s.add_development_dependency "sqlite3"
end
