$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "grantox/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "grantox"
  s.version     = Grantox::VERSION
  s.authors     = ["Devran Ünal"]
  s.email       = ["devran@me.com"]
  s.homepage    = "http://grantox.com"
  s.summary     = "A CMS."
  s.description = "Grantox is a modular CMS. Like Lego bricks."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.3"
  s.add_dependency 'mongoid', '4.0.2'
  s.add_dependency 'bson_ext'
  s.add_dependency 'mongoid-versioning'
  s.add_dependency 'mongoid-tree'
  s.add_dependency 'RedCloth'
  s.add_dependency 'bootstrap-sass', '~> 3.3.5'
  s.add_dependency 'sass-rails', '>= 3.2'
  
  s.add_dependency 'kaminari'
  s.add_dependency 'bootstrap-kaminari-views'
end
