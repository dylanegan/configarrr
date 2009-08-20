$:.unshift File.dirname(__FILE__)

module Configarrr
  class OptionError < StandardError; end
end

%w( base simple yaml ).each { |lib| require "configarrr/#{lib}" }
