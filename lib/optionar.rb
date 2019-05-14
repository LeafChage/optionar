require "optionar/version"

module Optionar
  class Error < StandardError; end
  def self::some(value)
    Optionar.new(value)
  end

  def self::none
    Optionar.new(nil)
  end

  class Optionar
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
        Optionar.new(yield @val)
      else
        self
      end
    end

    def map_or(default, &block)
      if some?
        Optionar.new(yield @val)
      else
        Optionar.new(yield default)
      end
    end

    def map_or_action(action, default_action)
      if some?
        Optionar.new(action.call @val)
      else
        Optionar.new(default_action.call)
      end
    end

    private

    def initialize(value)
      @val = value
    end
  end
end

