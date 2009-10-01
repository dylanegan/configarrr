require File.dirname(__FILE__) + '/../spec_helper'

class YAMLWithDefaults < Configarrr::YAML
  def defaults
    { 'first_key' => 1234, 'third_key' => 1234, 'parent' => { 'fourth_key' => 12345 } }
  end
end

describe Configarrr::YAML do
  before do
    @config = Configarrr::YAML.new(:file => SPEC_DIR + '/fixtures/config.yml')
  end

  context "initialising" do
    it "raises without a file being provided" do
      lambda { Configarrr::YAML.new }.should raise_error(ArgumentError, "Please provide a YAML file location.")
    end

    it "creates the file if necessary" do
      file = SPEC_DIR + '/fixtures/config.created.yml'
      FileUtils.rm(file) if File.exists?(file)
      Configarrr::YAML.new(:file => file)
      File.exists?(file).should be_true
    end

    it "sets options from the file" do
      @config.first_key.should == "first_value"
    end
  end

  context "choosing a parent scalar" do
    before do
      @yaml_parent = Configarrr::YAML.new(:file => SPEC_DIR + '/fixtures/config.yml', :parent => 'parent')
    end

    it "should return the parents children" do
      @yaml_parent.first_key.should == "first_parent_value"
    end

    it "should save all of the yaml, not just the parent scalar" do
      @yaml_parent.to_hash.should == @config.to_hash
    end

    context "when it doesn't exist" do
      it "should raise an Configarrr::OptionError" do
        lambda { Configarrr::YAML.new(:file => SPEC_DIR + '/fixtures/config.yml', :parent => 'non_existant_parent') }.should raise_error(Configarrr::OptionError, "Please provide a valid parent value. non_existant_parent does not exist.")
      end
    end
  end

  context "providing default settings" do
    before do
      @yaml_with_defaults = YAMLWithDefaults.new(:file => SPEC_DIR + '/fixtures/config.yml')
    end

    it "should not override provided settings" do
      @yaml_with_defaults.first_key.should_not == 1234
    end

    it "should provide setting if not provided" do
      @yaml_with_defaults.third_key.should == 1234
    end

    it "should work with multidimensional hashes" do
      @yaml_with_defaults.parent['fourth_key'].should == 12345
    end
  end

  it_should_behave_like "a Configarrr implementation"

  after :all do
    %w( created parent ).each do |file|
      File.unlink(SPEC_DIR + "/fixtures/config.#{file}.yml") if File.exists?(SPEC_DIR + "/fixtures/config.#{file}.yml")
    end
  end
end
