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
  end

  it_should_behave_like "a Configarrr implementation"
end
