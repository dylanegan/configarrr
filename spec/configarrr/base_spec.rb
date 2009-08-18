require File.dirname(__FILE__) + '/../spec_helper'

describe Configarrr::Base do
  before do
    @config = Configarrr::Base.new
  end

  it_should_behave_like "a Configarrr implementation"
end
