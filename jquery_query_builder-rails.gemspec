# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jquery_query_builder/rails/version'

Gem::Specification.new do |spec|
  spec.name          = "jquery_query_builder-rails"
  spec.version       = JqueryQueryBuilder::Rails::VERSION
  spec.authors       = ["Matthew Hirst"]
  spec.email         = ["hirst.mat@gmail.com"]

  spec.summary       = %q{The jQuery Query Builder JavaScript library + Dependencies ready for the Rails Asset Pipeline.}
  spec.homepage      = "https://github.com/SixiS/jquery_query_builder-rails"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files = Dir["{lib,vendor}/**/*"] + ["news.md", "MIT-LICENSE", "README.md"]

  spec.add_dependency "railties", ">= 3.1"
  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rails", "~> 3.2.12"
end
