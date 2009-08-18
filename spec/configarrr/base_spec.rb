require File.dirname(__FILE__) + '/../spec_helper'

class MyConfig < Configarrr::Base
  attr_accessor :my_option
end

describe Configarrr::Base do
  before do
    @config = Configarrr::Base.new
  end

  context "when inherited" do
    before do
      @my_config = MyConfig.configure do
        set :my_option, :my_value
      end
    end

    it "should work with defined attributes in child class" do
      @my_config.my_option.should == :my_value
    end

    it "should track defined attributes in child class" do
      @my_config.to_hash.keys.should include(:my_option)
    end
  end

  it_should_behave_like "a Configarrr implementation"
end
