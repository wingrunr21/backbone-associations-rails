# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'backbone-associations-rails/version'

Gem::Specification.new do |gem|
  gem.name          = "backbone-associations-rails"
  gem.version       = Backbone::Associations::Rails::VERSION
  gem.authors       = ["Stafford Brunk"]
  gem.email         = ["stafford.brunk@gmail.com"]
  gem.description   = %q{Backbone-associations provides a way of specifying 1:1 and 1:N relationships between Backbone models. Additionally, parent model instances (and objects extended from Backbone.Events) can listen in to CRUD events initiated on any children - in the object graph - by providing an appropriately qualified event path name.}
  gem.summary       = %q{Packages the backbone.associations library for use with the asset pipline}
  gem.homepage      = "https://github.com/wingrunr21/backbone-associations-rails"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
