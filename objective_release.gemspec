# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "objective_release/version"

Gem::Specification.new do |s|
  s.name        = "objective_release"
  s.homepage      = "http://github.com/shayfrendt/objective_release"
  s.license       = "MIT"
  s.version     = ObjectiveRelease::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Shay Frendt"]
  s.email       = ["shay.frendt@gmail.com"]
  s.summary     = %Q{Deploy your iOS applications with gusto!}
  s.description   = %Q{ObjectiveRelease gives you nice methods for updating your build version and release notes}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")
  s.require_paths = ["lib"]
  
  # Runtime Dependencies
  s.add_runtime_dependency 'plist', ['~> 3.1.0']
  s.add_runtime_dependency 'grit', ['~> 2.4.1']
  
  # Development Dependencies
  s.add_development_dependency 'rspec', ['~> 2.6.0']
  s.add_development_dependency 'mocha', ['~> 0.9.12']
end
