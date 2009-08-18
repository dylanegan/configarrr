require 'rubygems'
require 'spec'

SPEC_DIR = File.dirname(__FILE__) unless defined? SPEC_DIR
$:<< SPEC_DIR
 
require File.join(SPEC_DIR, '..', 'lib', 'configarrr')

require File.dirname(__FILE__) + '/shared'
