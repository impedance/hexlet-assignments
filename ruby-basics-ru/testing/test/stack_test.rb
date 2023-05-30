# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def test_push
    stack = Stack.new
    stack.push!('ruby')
    assert { stack.to_a == ['ruby'] }
  end

  def test_pop
    stack = Stack.new(['ruby'])
    stack.pop!
    assert { stack.to_a == [] }
  end

  def test_clear
    stack = Stack.new(['ruby', 'hash'])
    stack.clear!
    assert { stack.to_a == [] }
  end

  def test_emptiness
    stack = Stack.new
    assert { stack.empty? }
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
