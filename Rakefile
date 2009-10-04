begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "configarrr"
    gemspec.summary = "Pirates way of configuring, maties!"
    gemspec.description = "Actually it's not. It's just a way of handling configuration."
    gemspec.email = "dylanegan@gmail.com"
    gemspec.homepage = "http://github.com/abcde/configarrr"
    gemspec.authors = ["Dylan Egan"]
    gemspec.files = %w(README.markdown Rakefile VERSION) + Dir.glob("{lib,spec}/**/*")
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

require File.dirname(__FILE__) + '/tmp/vendor/environment'
require 'spec/rake/spectask'

Spec::Rake::SpecTask.new(:spec) do |t|
  desc "Run all specs in spec directory"
  t.spec_opts = ['--options', "\"spec/spec.opts\""]
  t.spec_files = FileList['spec/**/*_spec.rb']
end

desc "Run all specs by default"
task :default => :spec
