module BabyJbuilder
  class Template
    def self.render
      template = new
      yield template
      template.encode!
    end

    attr_accessor :attributes

    def initialize
      @attributes = ActiveSupport::OrderedHash.new
      yield self if ::Kernel.block_given?
    end

    def encode!
      ActiveSupport::JSON.encode @attributes
    end

    def set!(key, value = nil, *args)
      result = if ::Kernel.block_given?
                 yield
               else
                 value
               end

      _set_value key, result
    end

    private

    def method_missing(*args)
      if ::Kernel.block_given?
        set!(*args, &::Proc.new)
      else
        set!(*args)
      end
    end

    def _set_value(key, value)
      @attributes[key] = value
    end
  end
end
