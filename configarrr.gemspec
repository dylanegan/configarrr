# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{configarrr}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dylan Egan"]
  s.date = %q{2009-08-19}
  s.description = %q{Actually it's not. It's just a way of handling configuration.}
  s.email = %q{dylanegan@gmail.com}
  s.extra_rdoc_files = [
    "README.markdown"
  ]
  s.files = [
    "README.markdown",
     "Rakefile",
     "VERSION",
     "lib/configarrr.rb",
     "lib/configarrr/base.rb",
     "lib/configarrr/simple.rb",
     "lib/configarrr/yaml.rb",
     "spec/configarrr/base_spec.rb",
     "spec/configarrr/yaml_spec.rb",
     "spec/fixtures/config.created.yml",
     "spec/fixtures/config.parent.yml",
     "spec/fixtures/config.yml",
     "spec/shared.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/abcde/configarrr}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{Pirates way of configuring, maties!}
  s.test_files = [
    "spec/configarrr/base_spec.rb",
     "spec/configarrr/yaml_spec.rb",
     "spec/shared.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
