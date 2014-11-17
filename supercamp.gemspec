# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'supercamp/version'

Gem::Specification.new do |spec|
  spec.name          = "supercamp"
  spec.version       = Supercamp::VERSION
  spec.authors       = ["Dave Krupinski"]
  spec.email         = ["dave@davekrupinski.com"]
  spec.summary       = %q{Simple Interface to the ActiveNetwork Campgound API}
  spec.description   = %q{Simple Interface to the ActiveNetwork Campgound API}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "typhoeus", "~> 0.6.0"
  spec.add_dependency "oga",      "~> 0.1.0"
  spec.add_dependency "hashr",    "~> 0.0.0"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "dotenv", "~> 1.0.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1.0"
  spec.add_development_dependency "vcr", "~> 2.9.0"
  spec.add_development_dependency "guard-rspec", "~> 4.3.0"
end
