# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def test_push
    stack = Stack.new %w[one two]
    stack.push!('uno')
    stack.push!('trezo')
    assert { stack.to_a == ['one', 'two', 'uno', 'trezo'] }
    assert { stack.size == 4}
  end

  def test_pop
    stack = Stack.new %w[ruby js go c]
    stack.pop!
    stack.pop!
    assert { stack.to_a == ['ruby', 'js'] }
    assert { stack.size == 2 }
  end

  def test_clear
    stack = Stack.new(['ruby', 'hash'])
    stack.clear!
    assert { stack.empty? }
  end

  def test_emptiness
    stack = Stack.new
    assert { stack.empty? }
    assert { stack.to_a == [] }
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
