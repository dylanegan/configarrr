require 'yaml'

module Configarrr
  class YAML < Base
    def initialize(options = {})
      raise ArgumentError, "Please provide a YAML file location." unless options[:file]
      super(options)
      @file = File.expand_path(options[:file])
      ensure_file_exists
      set(::YAML.load_file(@file) || {})
    end

    def save
      ::File.open(@file, "w") { |file| file << self.to_hash.to_yaml }
    end

    private
      def ensure_file_exists
        unless ::File.exists?(@file)
          ::File.open(@file, "w") { |file| file << {}.to_yaml }
        end
      end
  end
end
