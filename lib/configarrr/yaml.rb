require 'yaml'

module Configarrr
  class YAML < Base
    # Initialise a new Configarrr::YAML object
    #
    # @param [Hash] options the options to be parsed
    # @return [Configarrr::YAML] self
    def initialize(options = {})
      raise ArgumentError, "Please provide a YAML file location." unless options[:file]
      super(options)
      ensure_file_exists
      @yaml = ::YAML.load_file(@file) || {}
      set_yaml
    end

    # An overridable method to provide default settings for YAML
    #
    # @return [Hash] a hash of default key and value pairings
    def defaults
      {}
    end

    # Take the YAML and set it
    def set_yaml
      if @parent
        @yaml.has_key?(@parent) ? set(defaults.recursive_merge(@yaml[@parent])) : raise(Configarrr::OptionError, "Please provide a valid parent value. #{@parent} does not exist.")
      else
        set defaults.recursive_merge(@yaml)
      end
    end

    # Get the key and value pairings and save it to the file
    def save
      ::File.open(@file, "w") { |file| file << self.to_hash.to_yaml }
    end

    # Ensure that if a YAML parent is provided that it is merged back in to the parsed YAML
    #
    # @return [Hash] a hash of the key and value pairings
    def to_hash
      @parent ? @yaml.merge({@parent => super}) : super
    end

    private
      def parse_options(options)
        @file = File.expand_path(options.delete(:file))
        @parent = options.delete(:parent)
        super
      end

      def ensure_file_exists
        unless ::File.exists?(@file)
          ::File.open(@file, "w") { |file| file << {}.to_yaml }
        end
      end
  end
end
