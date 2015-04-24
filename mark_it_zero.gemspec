$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mark_it_zero/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "mark_it_zero"
  spec.version     = MarkItZero::VERSION
  spec.authors     = ["Sean C Davis"]
  spec.email       = ["scdavis41@gmail.com"]
  spec.homepage    = "https://github.com/seancdavis/mark_it_zero"
  spec.summary     = "Syntax highlighted markdown editor for rails"
  spec.description = ""
  spec.license     = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", "~> 4.1.0"
  spec.add_dependency 'jquery-rails'
  spec.add_dependency 'sass-rails'
  spec.add_dependency 'redcarpet'
  spec.add_dependency 'pygments.rb'

  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "bundler", "~> 1.6"
end
