$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "consense/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "consense"
  s.version     = Consense::VERSION
  s.authors     = ["Emric"]
  s.email       = ["w.e.w@live.se"]
  s.homepage    = "http://standout.se/"
  s.summary     = "Just add water consent solution."
  s.description = "Engine for giving consent."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.0"

  s.add_development_dependency "sqlite3"
end
