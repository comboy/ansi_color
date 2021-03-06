# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ansi_color}
  s.version = "0.4.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["James Conroy-Finn","Kacper Ciesla"]
  s.date = %q{2009-05-12}
  s.email = %q{james@logi.cl}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.md"
  ]

  s.files = [
  "spec", "spec/ansi_color_spec.rb", "spec/ansi_color", "spec/ansi_color/effects_spec.rb", "spec/ansi_color/helpers_spec.rb", "spec/ansi_color/rainbow_spec.rb", "spec/ansi_color/string_spec.rb", "spec/spec_helper.rb", "spec/spec.opts", "VERSION.yml", "LICENSE", "lib", "lib/ansi_color", "lib/ansi_color/effects.rb", "lib/ansi_color/rainbow.rb", "lib/ansi_color/string.rb", "lib/ansi_color/helpers.rb", "lib/ansi_color.rb", "Rakefile", "ansi_color.gemspec", "README.md"]

  s.has_rdoc = true
  s.homepage = %q{http://github.com/jcf/ansi_color}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{TODO}
  s.test_files = [
    "spec/ansi_color/effects_spec.rb",
    "spec/ansi_color/helpers_spec.rb",
    "spec/ansi_color/rainbow_spec.rb",
    "spec/ansi_color_spec.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
