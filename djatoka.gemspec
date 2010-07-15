# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{djatoka}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jason Ronallo"]
  s.date = %q{2010-07-15}
  s.default_executable = %q{djatoka_url}
  s.description = %q{The djatoka library provides some simple methods for creation of the OpenURLs needed to communicate with the Djatoka image server.}
  s.email = %q{jronallo@gmail.com}
  s.executables = ["djatoka_url"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "bin/djatoka_url",
     "generators/djatoka/djatoka_generator.rb",
     "generators/djatoka/templates/OpenLayers.js",
     "generators/djatoka/templates/OpenURL.js",
     "generators/djatoka/templates/blank.gif",
     "generators/djatoka/templates/djatoka-initializer.rb",
     "generators/djatoka/templates/djatoka.js",
     "generators/djatoka/templates/east-mini.png",
     "generators/djatoka/templates/north-mini.png",
     "generators/djatoka/templates/south-mini.png",
     "generators/djatoka/templates/west-mini.png",
     "generators/djatoka/templates/zoom-minus-mini.png",
     "generators/djatoka/templates/zoom-plus-mini.png",
     "generators/djatoka/templates/zoom-world-mini.png",
     "lib/djatoka.rb",
     "lib/djatoka/common.rb",
     "lib/djatoka/metadata.rb",
     "lib/djatoka/net.rb",
     "lib/djatoka/region.rb",
     "lib/djatoka/resolver.rb",
     "lib/djatoka/view_helpers.rb"
  ]
  s.homepage = %q{http://github.com/jronallo/djatoka}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Djatoka image server helpers for Ruby and Rails.}
  s.test_files = [
    "test/test_metadata.rb",
     "test/test_djatoka.rb",
     "test/test_resolver.rb",
     "test/test_view_helpers.rb",
     "test/test_region.rb",
     "test/helper.rb",
     "test/test_common.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<ruby-debug>, [">= 0"])
      s.add_runtime_dependency(%q<addressable>, ["= 2.1.2"])
      s.add_runtime_dependency(%q<json>, [">= 0"])
      s.add_runtime_dependency(%q<trollop>, [">= 0"])
      s.add_runtime_dependency(%q<mash>, [">= 0"])
    else
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<ruby-debug>, [">= 0"])
      s.add_dependency(%q<addressable>, ["= 2.1.2"])
      s.add_dependency(%q<json>, [">= 0"])
      s.add_dependency(%q<trollop>, [">= 0"])
      s.add_dependency(%q<mash>, [">= 0"])
    end
  else
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<ruby-debug>, [">= 0"])
    s.add_dependency(%q<addressable>, ["= 2.1.2"])
    s.add_dependency(%q<json>, [">= 0"])
    s.add_dependency(%q<trollop>, [">= 0"])
    s.add_dependency(%q<mash>, [">= 0"])
  end
end

