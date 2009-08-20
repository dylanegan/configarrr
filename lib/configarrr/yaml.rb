require 'yaml'

module Configarrr
  class YAML < Base
    def initialize(options = {})
      raise ArgumentError, "Please provide a YAML file location." unless options[:file]
      super(options)
      ensure_file_exists
      @yaml = ::YAML.load_file(@file) || {}
      set_yaml
    end

    def set_yaml
      if @parent
        @yaml.has_key?(@parent) ? set(@yaml[@parent]) : raise(Configarrr::OptionError, "Please provide a valid parent value. #{@parent} does not exist.")
      else
        set @yaml
      end
    end

    def save
      ::File.open(@file, "w") { |file| file << self.to_hash.to_yaml }
    end

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
