# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{geocoder}
  s.version = "0.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Namit Chadha"]
  s.date = %q{2011-04-20}
  s.description = %q{Geocoding API for Google and Yahoo geocoding Web Services}
  s.email = %q{nc@appspark.us}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.markdown"
  ]
  s.files = [
    ".document",
    ".rspec",
    "LICENSE",
    "README.markdown",
    "Rakefile",
    "VERSION",
    "geocoder.gemspec",
    "lib/geocoder.rb",
    "lib/geocoder/base.rb",
    "lib/geocoder/geocoding_response.rb",
    "lib/geocoder/geocoding_result.rb",
    "lib/geocoder/google.rb",
    "lib/geocoder/yahoo.rb",
    "spec/geocoder_spec.rb",
    "spec/google_spec.rb",
    "spec/spec_helper.rb",
    "spec/yahoo_spec.rb"
  ]
  s.homepage = %q{http://github.com/nc/geocoder}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Geocoding API for Google and Yahoo geocoding Web Services}
  s.test_files = [
    "spec/geocoder_spec.rb",
    "spec/google_spec.rb",
    "spec/spec_helper.rb",
    "spec/yahoo_spec.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
    else
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
  end
end

