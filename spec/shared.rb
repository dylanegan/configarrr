shared_examples_for "a Configarrr implementation" do
  context "configure" do
    before :each do
      @config.configure do
        set :key, :value
      end
    end

    it "should allow you to set values" do
      @config.key.should == :value
    end
  end  
end
