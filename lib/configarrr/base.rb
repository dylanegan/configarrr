module Configarrr
  class Base
    # Initialise a new Configarrr::Base object
    #
    # @param [Hash] options the options to be parsed
    # @return [Configarrr::Base] self
    def initialize(options = {})
      @keys = []
      parse_options(options)
    end

    # Helper method to configure a new object and return it
    #
    # @param [Hash] options the options to be parsed
    # @param [Proc] block the block to be evaluated
    # @return [Configarrr::Base] the initialised configarrr object
    def self.configure(options = {}, &block)
      config = new(options)
      config.configure(&block)
      config
    end

    # Allow a block to be passed and evaluated
    #
    # @param [Proc] block the block to be evaluated
    def configure(&block)
      instance_eval(&block)
    end

    # Sets the key to the value specified and returns self
    #
    # @param [Hash, String, Symbol] key the name of settings key
    # @param [Object] value the value of the settings key
    def set(key, value=self)
      if value.kind_of?(Proc)
        metadef(key, &value)
        metadef("#{key}?") { !!__send__(key) }
        metadef("#{key}=") { |val| set(key, Proc.new{val}) }
        @keys << key 
      elsif value == self && key.is_a?(Hash)
        key.to_hash.each { |k,v| set(k, v) }
      elsif respond_to?("#{key}=")
        __send__ "#{key}=", value
        @keys << key 
      else
        set key, Proc.new{value}
      end
      self
    end

    # Returns a hash of all the set keys and their values
    #
    # @return [Hash] a hash of the keys and values
    def to_hash
      @keys.inject({}) do |hash, key|
        hash[key] = __send__ "#{key}"
        hash
      end
    end

    private
      def parse_options(options)
      end

      def metadef(message, &block)
        (class << self; self; end).
          send :define_method, message, &block
      end
  end
end
