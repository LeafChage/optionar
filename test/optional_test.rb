require "test_helper"

class OptionalTest < Minitest::Test
  VALUE = 10
  DEFAULT_VALUE = 20

  def setup
    @some = Optional::some(VALUE)
    @none1 = Optional::none()
    @none2 = Optional::some(nil)
  end

  def test_that_it_has_a_version_number
    refute_nil ::Optional::VERSION
  end

  def test_some?
    assert @some.some? == true
    assert @none1.some? == false
    assert @none2.some? == false
  end

  def test_none?
    assert @some.none? == false
    assert @none1.none? == true
    assert @none2.none? == true
  end

  def test_wrap
    assert @some.wrap == VALUE
    assert @none1.wrap == nil
    assert @none2.wrap == nil
  end

  def test_wrap_or
    assert @some.wrap_or(DEFAULT_VALUE) == VALUE
    assert @none1.wrap_or(DEFAULT_VALUE) == DEFAULT_VALUE
    assert @none2.wrap_or(DEFAULT_VALUE) == DEFAULT_VALUE
  end

  def test_map
    assert @some.map(){|v| v + 1}.wrap() == @some.wrap + 1
    assert @none1.map(){|v| v + 1}.wrap() == nil
    assert @none2.map(){|v| v + 1}.wrap() == nil
  end

  def test_map_or
    assert @some.map_or(DEFAULT_VALUE){|v| v + 1}.wrap() == @some.wrap + 1
    assert @none1.map_or(DEFAULT_VALUE){|v| v + 1}.wrap() == DEFAULT_VALUE + 1
    assert @none2.map_or(DEFAULT_VALUE){|v| v + 1}.wrap() == DEFAULT_VALUE + 1
  end

  def test_map_or_action
    assert @some.map_or_action(->(v){v + 1}, ->{5000}).wrap() == @some.wrap + 1
    assert @none1.map_or_action(->(v){v + 1}, ->{5000}).wrap() == 5000
    assert @none2.map_or_action(->(v){v + 1}, ->{5000}).wrap() == 5000
  end
end
