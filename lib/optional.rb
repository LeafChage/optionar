require "optional/version"

module Optional
  class Error < StandardError; end
  def self::some(value)
    Optional.new(value)
  end

  def self::none
    Optional.new(nil)
  end

  class Optional
    def some?
      @val != nil
    end

    def none?
      @val == nil
    end

    def wrap
      @val
    end

    def wrap_or(default)
      some? ? @val : default
    end

    def map(&block)
      if some?
        Optional.new(yield @val)
      else
        self
      end
    end

    def map_or(default, &block)
      if some?
        Optional.new(yield @val)
      else
        Optional.new(yield default)
      end
    end

    def map_or_action(action, default_action)
      if some?
        Optional.new(action.call @val)
      else
        Optional.new(default_action.call)
      end
    end

    private

    def initialize(value)
      @val = value
    end
  end
end

