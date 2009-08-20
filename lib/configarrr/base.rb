module Configarrr
  class Base
    def initialize(options = {})
      @keys = []
      parse_options(options)
    end

    def self.configure(options = {}, &block)
      config = new(options)
      config.configure(&block)
      config
    end

    def configure(&block)
      instance_eval(&block)
    end

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
