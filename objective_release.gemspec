# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{objective_release}
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["shayfrendt"]
  s.date = %q{2011-07-06}
  s.description = %q{ObjectiveRelease gives you nice methods for updating your build version and release notes}
  s.email = %q{shay.frendt@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".gitignore",
    ".rspec",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "lib/objective_release.rb",
    "lib/objective_release/release.rb",
    "spec/fixtures/Config-End.plist",
    "spec/fixtures/Config-Start.plist",
    "spec/fixtures/Config-Test.plist",
    "spec/fixtures/RELEASE_NOTES_END",
    "spec/fixtures/RELEASE_NOTES_START",
    "spec/fixtures/RELEASE_NOTES_TEST",
    "spec/objective_release/release_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/shayfrendt/objective_release}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Deploy your iOS applications with gusto!}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<plist>, ["= 3.1.0"])
      s.add_runtime_dependency(%q<grit>, ["= 2.4.1"])
      s.add_development_dependency(%q<rspec>, ["~> 2.6.0"])
      s.add_development_dependency(%q<yard>, ["~> 0.6.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.3"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_runtime_dependency(%q<plist>, ["= 3.1.0"])
      s.add_runtime_dependency(%q<grit>, ["= 2.4.1"])
    else
      s.add_dependency(%q<plist>, ["= 3.1.0"])
      s.add_dependency(%q<grit>, ["= 2.4.1"])
      s.add_dependency(%q<rspec>, ["~> 2.6.0"])
      s.add_dependency(%q<yard>, ["~> 0.6.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.3"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<plist>, ["= 3.1.0"])
      s.add_dependency(%q<grit>, ["= 2.4.1"])
    end
  else
    s.add_dependency(%q<plist>, ["= 3.1.0"])
    s.add_dependency(%q<grit>, ["= 2.4.1"])
    s.add_dependency(%q<rspec>, ["~> 2.6.0"])
    s.add_dependency(%q<yard>, ["~> 0.6.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.3"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<plist>, ["= 3.1.0"])
    s.add_dependency(%q<grit>, ["= 2.4.1"])
  end
end
