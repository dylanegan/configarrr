module Configarrr
  class Base
    def initialize(options = {})
      @options = []
    end

    def self.configure(options = {}, &block)
      config = new(options)
      config.configure(&block)
      config
    end

    def configure(&block)
      instance_eval(&block)
    end

    def set(option, value=self)
      if value.kind_of?(Proc)
        metadef(option, &value)
        metadef("#{option}?") { !!__send__(option) }
        metadef("#{option}=") { |val| set(option, Proc.new{val}) }
        @options << option
      elsif value == self && option.is_a?(Hash)
        option.to_hash.each { |k,v| set(k, v) }
      elsif respond_to?("#{option}=")
        __send__ "#{option}=", value
        @options << option
      else
        set option, Proc.new{value}
      end
      self
    end

    def to_hash
      @options.inject({}) do |hash, option|
        hash[option] = __send__ "#{option}"
        hash
      end
    end

    private
      def metadef(message, &block)
        (class << self; self; end).
          send :define_method, message, &block
      end
  end
end
