$:.unshift File.dirname(__FILE__)

%w( base simple yaml ).each { |lib| require "configarrr/#{lib}" }
