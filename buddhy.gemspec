# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{buddhy}
  s.version = "0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Josh Lubaway"]
  s.date = %q{2011-04-20}
  s.email = %q{dontneedmoreemail@example.com}
  s.extra_rdoc_files = ["Readme.md"]
  s.files = Dir["lib/**/*"]
  s.homepage = %q{http://github.com/jish/buddhy}
  s.rdoc_options = ["--main", "README.md"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{An IRC bot framework}

  if s.respond_to? :specification_version then
    s.specification_version = 3
  end
end
