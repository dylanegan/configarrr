$:.unshift File.dirname(__FILE__)

%w( base simple ).each { |lib| require "configarrr/#{lib}" }
