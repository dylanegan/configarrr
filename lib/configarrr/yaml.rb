require 'yaml'

module Configarrr
  class YAML < Base
    def initialize(options = {})
      raise ArgumentError, "Please provide a YAML file location." unless options[:file]
      super(options)
      @file = File.expand_path(options[:file])
      ensure_file_exists
      @yaml = ::YAML.load_file(@file) || {}
      if @parent = options[:parent] and @yaml.has_key? @parent
        set @yaml[@parent]
      elsif @parent
        raise ArgumentError, "Please provide a valid parent value. #{@parent} does not exist."
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
      def ensure_file_exists
        unless ::File.exists?(@file)
          ::File.open(@file, "w") { |file| file << {}.to_yaml }
        end
      end
  end
end
