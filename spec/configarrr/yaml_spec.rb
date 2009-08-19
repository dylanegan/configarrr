require File.dirname(__FILE__) + '/../spec_helper'

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
      it "should raise an ArgumentError" do
        lambda { Configarrr::YAML.new(:file => SPEC_DIR + '/fixtures/config.yml', :parent => 'non_existant_parent') }.should raise_error(ArgumentError, "Please provide a valid parent value. non_existant_parent does not exist.")
      end
    end
  end

  it_should_behave_like "a Configarrr implementation"
end
