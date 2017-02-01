# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tourist_guide/version'

Gem::Specification.new do |spec|
  spec.name          = "tourist_guide"
  spec.version       = TouristGuide::VERSION
  spec.authors       = ["Dina Aziz"]
  spec.email         = ["dina.aziz100@yahoo.com"]

  spec.summary       = %q{Write a short summary, because Rubygems requires one.}
  spec.description   = %q{Write a longer description or delete this line.}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = ["tourist_guide"]
  spec.require_paths = ["lib", "lib/tourist_guide"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "Nokogiri"
  spec.add_development_dependency "pry"
end
