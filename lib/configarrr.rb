$:.unshift File.dirname(__FILE__)

module Configarrr
  class OptionError < StandardError; end
end

require 'core_ext'

%w( base simple yaml ).each { |lib| require "configarrr/#{lib}" }
